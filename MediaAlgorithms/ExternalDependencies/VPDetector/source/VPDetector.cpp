#include "VPDetector.hpp"

//------------------------------------------------------------------------------------------------------------------------------------------------------------
// 	INDEPENDENT FUNCTIONS
//------------------------------------------------------------------------------------------------------------------------------------------------------------

int labelBlobs(cv::Mat &img)
{
	//Input must be a 8-bit single channel image (binary image)
    if(img.empty() || img.type() != CV_8UC1) return -1;

    //Use cloned image so input to avoid modifying the original
    cv::Mat img2 = img.clone();

    //Amount of blobs found
    int nBlobs = 0;

    //Label blobs
    for(int j = 0; j < img.rows; j++)
    {
        for(int i = 0; i < img.cols; i++)
        {
            if(img2.at<uchar>(j,i) != 0)
            {
                nBlobs++;
                cv::floodFill(img,cv::Point(i,j),cv::Scalar(nBlobs));
                cv::floodFill(img2,cv::Point(i,j),cv::Scalar(0));
            }
        }
    }
    return nBlobs;
}

int labelBigBlobs(cv::Mat &img, int minSize)
{
    //Input must be a 8-bit single channel image (binary image)
    if(img.empty() || img.type() != CV_8UC1) return -1;

    //Use cloned image so input to avoid modifying the original
    cv::Mat img2 = img.clone();

    //Amount of blobs found
    int nBlobs = 0;

    //Label blobs
    for(int j = 0; j < img.rows; j++)
    {
        for(int i = 0; i < img.cols; i++)
        {
            if(img2.at<uchar>(j,i) != 0)
            {
                int size = cv::floodFill(img,cv::Point(i,j),cv::Scalar(nBlobs+1));
        if(size > minSize) nBlobs++;
        else cv::floodFill(img,cv::Point(i,j),cv::Scalar(0));
                cv::floodFill(img2,cv::Point(i,j),cv::Scalar(0));
            }
        }
    }
    return nBlobs;
}

bool area_centroid_radius(cv::Mat &img, std::vector<cv::Point> &centroid, std::vector<int> &area, std::vector<float> &radius, std::vector<int> &contourLenght, std::vector<cv::Rect> &boxes)
{
	//Input must be a 8-bit single channel image (binary image)
    if(img.empty() || img.type() != CV_8UC1) return false;

    std::vector<double> m00, m10, m01;
    std::vector<double> xx, yy;
    std::vector<uchar> labels;
    std::vector<uchar>::iterator ite;
    uchar pixel;
    int index;

    for(int j = 0; j < img.rows; j++)
    {
        for(int i = 0; i < img.cols; i++)
        {
            pixel = img.at<uchar>(j,i);
            if(pixel != 0)
            {
                //Get the index for the found labeled pixel
                ite = std::find(labels.begin(),labels.end(),pixel);
                index = ite - labels.begin();

                //If this is the first time "pixel" label is found,
                //allocate memory for its proccessing
                if(index == static_cast<int>(labels.size()))
                {
                    labels.push_back(pixel);
                    m00.push_back(0);
                    m10.push_back(0);
                    m01.push_back(0);
                    xx.push_back(0);
                    yy.push_back(0);
                }

                //Compute the area, sum over x & y
                m00[index]++;
                m10[index] += i;
                m01[index] += j;
            }
        }
    }

    //Compute the centroid's coordinates for each labeled blob found
    for(unsigned int i = 0; i < labels.size(); i++)
    {
        xx[i] = m10[i] / m00[i];
        yy[i] = m01[i] / m00[i];
    }

    //Erase anything inside the input vectors
    centroid.clear();
    area.clear();
    radius.clear();
    contourLenght.clear();
    boxes.clear();

    //Store results in input vectors
    for(unsigned int i = 0; i < labels.size(); i++)
    {
        cv::Point p;
        p.x = xx[i];
        p.y = yy[i];
        centroid.push_back(p);
        area.push_back(m00[i]);
    }

    //Compute radius of minimum enclosing circle and the bounding box for each blob
    std::vector<std::vector<cv::Point>> contours;
    cv::findContours(img,contours,CV_RETR_EXTERNAL,CV_CHAIN_APPROX_NONE);
    if(contours.size() != area.size()) return false;
    radius.resize(contours.size());
    contourLenght.resize(contours.size());
    boxes.resize(contours.size());
    for(unsigned int i = 0; i < contours.size(); i++)
    {
        float rad;
        cv::Point2f center;
        cv::minEnclosingCircle(cv::Mat(contours[i]),center,rad);
	cv::Rect temp_box = cv::boundingRect(cv::Mat(contours[i]));
        int selected_blob=0;
        double min_dist=100000000;
        for(unsigned int j = 0; j < contours.size(); j++)
        {
            double d = sqrt(pow(centroid[j].x - center.x,2) + pow(centroid[j].y - center.y,2));
            if(d < min_dist)
            {
                min_dist = d;
                selected_blob = j;
            }
        }
        radius[selected_blob] = rad;
        contourLenght[selected_blob] = contours[i].size();
	boxes[selected_blob] = temp_box;
    }

    //Make the blobs inside the image visible
    cv::threshold(img,img,0,255,0);

    //Return true as flag of success
    return true;
}

bool featureExtraction(cv::Mat &img, std::vector<cv::Point> &centroid, std::vector<int> &area, std::vector<float> &radius, std::vector<int> &contourLenght, std::vector<cv::Rect> &boxes, std::vector<cv::Point> &seed)
{
    //Input must be a 8-bit single channel image (binary image)
    if(img.empty() || img.type() != CV_8UC1) return false;

    std::vector<double> m00, m10, m01;
    std::vector<double> xx, yy;
    std::vector<uchar> labels;
    std::vector<uchar>::iterator ite;
    uchar pixel;
    int index;

    for(int j = 0; j < img.rows; j++)
    {
        for(int i = 0; i < img.cols; i++)
        {
            pixel = img.at<uchar>(j,i);
            if(pixel != 0)
            {
                //Get the index for the found labeled pixel
                ite = std::find(labels.begin(),labels.end(),pixel);
                index = ite - labels.begin();

                //If this is the first time "pixel" label is found,
                //allocate memory for its proccessing
                if(index == static_cast<int>(labels.size()))
                {
                    labels.push_back(pixel);
                    m00.push_back(0);
                    m10.push_back(0);
                    m01.push_back(0);
                    xx.push_back(0);
                    yy.push_back(0);
                }

                //Compute the area, sum over x & y
                m00[index]++;
                m10[index] += i;
                m01[index] += j;
            }
        }
    }

    //Compute the centroid's coordinates for each labeled blob found
    for(unsigned int i = 0; i < labels.size(); i++)
    {
        xx[i] = m10[i] / m00[i];
        yy[i] = m01[i] / m00[i];
    }

    //Erase anything inside the input vectors
    centroid.clear();
    area.clear();
    radius.clear();
    contourLenght.clear();
    boxes.clear();
    seed.clear();

    //Store results in input vectors
    for(unsigned int i = 0; i < labels.size(); i++)
    {
        cv::Point p;
        p.x = xx[i];
        p.y = yy[i];
        centroid.push_back(p);
        area.push_back(m00[i]);
    }

    //Compute radius of minimum enclosing circle and the bounding box for each blob
    std::vector<std::vector<cv::Point>> contours;
    cv::findContours(img,contours,CV_RETR_EXTERNAL,CV_CHAIN_APPROX_NONE);
    radius.resize(contours.size());
    contourLenght.resize(contours.size());
    boxes.resize(contours.size());
    seed.resize(contours.size());
    for(unsigned int i = 0; i < contours.size(); i++)
    {
        float rad;
        cv::Point2f center;
        cv::minEnclosingCircle(cv::Mat(contours[i]),center,rad);
    cv::Rect temp_box = cv::boundingRect(cv::Mat(contours[i]));
        int selected_blob=0;
        double min_dist=100000000;
        for(unsigned int j = 0; j < contours.size(); j++)
        {
            double d = sqrt(pow(centroid[j].x - center.x,2) + pow(centroid[j].y - center.y,2));
            if(d < min_dist)
            {
                min_dist = d;
                selected_blob = j;
            }
        }
        radius[selected_blob] = rad;
        contourLenght[selected_blob] = contours[i].size();
    boxes[selected_blob] = temp_box;
    seed[selected_blob] = contours[i][0];
    }

    //Make the blobs inside the image visible
    cv::threshold(img,img,0,255,0);

    //Return true as flag of success
    return true;
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------
// 	FEATURE-VECTOR CLASS METHODS
//------------------------------------------------------------------------------------------------------------------------------------------------------------

//Default constructor
FeatVec::FeatVec()
{
    Area = 0;
    AreaCircle = 0;
    ContourLenght = 0;
    AspectRatio = 0;
}

//Initialized constructor
FeatVec::FeatVec(int area, float areaCircle, int contourLenght, float aspectRatio)
{
    if(area >= 0 && areaCircle >= 0 && contourLenght >= 0 && aspectRatio >= 0)
    {
        Area = area;
        AreaCircle = areaCircle;
        ContourLenght = contourLenght;
	AspectRatio = aspectRatio;
    }
    else
    {
    	Area = 0;
	AreaCircle = 0;
	ContourLenght = 0;
	AspectRatio = 0;
    }
}

//Set method
void FeatVec::set(int area, float areaCircle, int contourLenght, float aspectRatio)
{
    if(area >= 0 && areaCircle >= 0 && contourLenght >= 0)
    {
        Area = area;
        AreaCircle = areaCircle;
        ContourLenght = contourLenght;
	AspectRatio = aspectRatio;
    }
}

//Get method
std::vector<float> FeatVec::get()
{
    std::vector<float> features;
    features.resize(4);
    features[0] = static_cast<float>(Area);
    features[1] = AreaCircle;
    features[2] = static_cast<float>(ContourLenght);
    features[3] = AspectRatio;

    return features;
}

//Method to compute the euclidean ditance between two FeatVec objects
float FeatVec::distance(FeatVec &fv)
{
    std::vector<float> v1;
    std::vector<float> v2;
    v1 = get();
    v2 = fv.get();

    float d = 0;
    for(unsigned int i = 0; i < v1.size(); i++)
    {
        d += pow(v1[i] - v2[i], 2);
    }
    d = sqrt(d);

    return d;
}

//Method to compute the similarity between two FeatVec objects
float FeatVec::similarity(FeatVec &fv, float areaNorm, float contNorm)
{
    std::vector<float> feat1,feat2;
    feat1 = get();
    feat2 = fv.get();

    float sum = 0;
    sum = pow((feat1[0]-feat2[0])/areaNorm, 2) +
          pow(feat1[1]-feat2[1], 2)            +
          pow((feat1[2]-feat2[2])/contNorm, 2);
    sum = sqrt(sum);

    return 0.5 / (0.5 + sum);
}

//Method to compute the similarity between two vectors based only on their compactness and aspect ratio
float FeatVec::similarity2(FeatVec &fv, float aspectNorm)
{
	std::vector<float> feat1,feat2;
	feat1 = get();
	feat2 = fv.get();

	float sum = 0;
	sum = pow(feat1[1]-feat2[1],2) + pow((feat1[3]-feat2[3])/aspectNorm,2);
	sum = sqrt(sum);

	return 0.5 / (0.5 + sum);
}

//Method to compute the similarity between two vectors based on a custom subset of features defined in the
//params vector
float FeatVec::similarity4(FeatVec &fv, std::vector<float> &params)
{
    if(params.size() != 9) return -1.0;

    std::vector<float> feat1,feat2;
    feat1 = get();
    feat2 = fv.get();

    std::vector<float> normalizer;
    normalizer.push_back(params[4]);
    normalizer.push_back(1.0);
    normalizer.push_back(params[5]);
    normalizer.push_back(params[6]);

    float sum = 0.0;
    for(unsigned int i = 0; i < feat1.size(); i++)
    {
        if(params[i] != 0)
        {
            sum += pow((feat1[i] - feat2[i]) / normalizer[i],2);
        }
    }
    sum = sqrt(sum);

    return 0.5 / (0.5 + sum);
}

//Method to get the area value
int FeatVec::area()
{
    return Area;
}

//Method to get the circle area value
float FeatVec::circa()
{
    return AreaCircle;
}

//Method to get the contour lenght value
int FeatVec::cont()
{
    return ContourLenght;
}

//Method to get the aspect ratio value
float FeatVec::aspect()
{
    return AspectRatio;
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------
// 	TRACKER CLASS METHODS
//------------------------------------------------------------------------------------------------------------------------------------------------------------

//Default constructor
Tracker::Tracker():
Image()
{
    n = 0;
    m = 0;
    nRecords = 12;
}

//This method does basic blob tracking
void Tracker::track(cv::Mat &img_foreground)
{
	//1. FEATURE EXTRACTION
    std::vector<int> Area;
    std::vector<int> ContourLenght;
    std::vector<cv::Point> Centroid;
    std::vector<float> Radius;
    std::vector<cv::Rect> BoundingBox;
    std::vector<int> Hash;
    std::vector<FeatVec> Feature;

    labelBlobs(img_foreground);
    area_centroid_radius(img_foreground,Centroid,Area,Radius,ContourLenght,BoundingBox);

    for(unsigned int i = 0; i < Radius.size(); i++)
    {
        float circleArea = 3.1415926535897 * pow(Radius[i],2);
        circleArea = (circleArea - Area[i]) / circleArea;
	float aspectRatio = BoundingBox[i].height / BoundingBox[i].width;
        FeatVec fv(Area[i], circleArea, ContourLenght[i], aspectRatio);
        Feature.push_back(fv);
    }
    cv::cvtColor(img_foreground, Image, CV_GRAY2BGR);

    n = m;
    m = Area.size();

    if(n > 0 && m > 0)
    {
        int last_record = CentroidRecord.size()-1;

        //2. D-MATRIX COMPUTATION
        std::vector< std::vector<double> > D;
        for(int i = 0; i < n; i++)
        {
        	std::vector<double> d_(m,0.0);
        	D.push_back(d_);
        }
        for(int j = 0; j < n; j++)
        {
            for(int i = 0; i < m; i++)
            {
                D[j][i] = sqrt(pow(CentroidRecord[last_record][j].x - Centroid[i].x,2) + pow(CentroidRecord[last_record][j].y - Centroid[i].y,2));
            }
        }

        //3. V-MATRIX COMPUTATION
        std::vector< std::vector<double> > V;
        for(int i = 0; i < n; i++)
        {
        	std::vector<double> v_(m,0.0);
        	V.push_back(v_);
        }
        for(int i = 0; i < m; i++)
        {
            double temp = 9999999;
            int index = -1;
            for(int j = 0; j < n; j++)
            {
                if(D[j][i] < temp)
                {
                    temp = D[j][i];
                    index = j;
                }
            }
            V[index][i] = 1;
        }

        //4. VV-MATRIX COMPUTATION
        std::vector< std::vector<double> > VV;
        for(int i = 0; i < n; i++)
        {
        	std::vector<double> vv_(m,0.0);
        	VV.push_back(vv_);
        }
        for(int j = 0; j < n; j++)
        {
            double temp = 9999999;
            int index = -1;
            for(int i = 0; i < m; i++)
            {
                if(D[j][i] < temp)
                {
                    temp = D[j][i];
                    index = i;
                }
            }
            VV[j][index] = 1;
        }

        //5. ONE-2-ONE LABELING
        Hash.clear();
        Hash.resize(m,-1);
        for(int j = 0; j < n; j++)
        {
            for(int i = 0; i < m; i++)
            {
                if(V[j][i]==1 && VV[j][i]==1)
                {
                    Hash[i] = j;
                }
            }
        }

        //6. SAVE LABELING RESULT
        HashRecord.push_back(Hash);
    }

    if(m == 0)
    {
        HashRecord.clear();
        CentroidRecord.clear();
        FeatureRecord.clear();
        RadiusRecord.clear();
    }

    if(m > 0)
    {
        CentroidRecord.push_back(Centroid);
        FeatureRecord.push_back(Feature);
        RadiusRecord.push_back(Radius);
    }

    if(static_cast<int>(CentroidRecord.size()) > nRecords)
    {
        HashRecord.erase(HashRecord.begin());
        CentroidRecord.erase(CentroidRecord.begin());
        FeatureRecord.erase(FeatureRecord.begin());
        RadiusRecord.erase(RadiusRecord.begin());
    }
}

//Method which draws a set of descriptive events for user visualization
bool Tracker::draw()
{
    if(m > 0 && n > 0)
    {
        for(unsigned int i = 0; i < HashRecord.size(); i++)
        {
            for(unsigned int j = 0; j < HashRecord[i].size(); j++)
            {
                cv::Scalar color;
                int index = HashRecord[i][j];
                if(index == -1) continue;
                else if(index < 0)
                {
                    index = (-1) * (index + 2);
                    color = cv::Scalar(255,0,0);
                }
                else
                {
                    color = cv::Scalar(0,255,0);
                }

                cv::line(Image,CentroidRecord[i+1][j],CentroidRecord[i][index],color,1);
            }

            if(i == HashRecord.size()-1)
            {
                for(unsigned int j = 0; j < CentroidRecord[i+1].size(); j++)
                {
                    cv::circle(Image,CentroidRecord[i+1][j],RadiusRecord[i+1][j],cv::Scalar(0,0,255));
                }
            }
        }

        return true;
    }
    else
    {
        Image = cv::Scalar(0);
        return false;
    }
}

//Method which draws a set of descriptive events for user visualization
bool Tracker::draw(cv::Mat &img)
{
    if(m > 0 && n > 0)
    {
        for(unsigned int i = 0; i < HashRecord.size(); i++)
        {
            for(unsigned int j = 0; j < HashRecord[i].size(); j++)
            {
                cv::Scalar color;
                int index = HashRecord[i][j];
                if(index == -1) continue;
                else if(index < 0)
                {
                    index = (-1) * (index + 2);
                    color = cv::Scalar(255,0,0);
                }
                else
                {
                    color = cv::Scalar(0,255,0);
                }

                cv::line(img,CentroidRecord[i+1][j],CentroidRecord[i][index],color,1);
            }

            if(i == HashRecord.size()-1)
            {
                for(unsigned int j = 0; j < CentroidRecord[i+1].size(); j++)
                {
                    cv::circle(img,CentroidRecord[i+1][j],RadiusRecord[i+1][j],cv::Scalar(0,0,255));
                }
            }
        }

        return true;
    }
    else
    {
        return false;
    }
}

//Returns the image where the tracking events are drawn
cv::Mat Tracker::getImage()
{
    return Image;
}

//Returns the number of data records are stored for that specific instant. HashRecord's size will always be 1 record below.
int Tracker::recordSize()
{
    return CentroidRecord.size();
}

//Returns a set of Centroid-point values stored in a specific record, referenced by "index".
std::vector<cv::Point> Tracker::getCentroidRecord(int index)
{
    if(index < 0 || index >= static_cast<int>(CentroidRecord.size())) return std::vector<cv::Point>();
    else return CentroidRecord[index];
}

//Returns a set of Radius values stored in a specific record, referenced by "index".
std::vector<float> Tracker::getRadiusRecord(int index)
{
    if(index < 0 || index >= static_cast<int>(RadiusRecord.size())) return std::vector<float>();
    else return RadiusRecord[index];
}

//Returns a Hash-table, which realtes two records, stored in a specific record, referenced by "index".
std::vector<int> Tracker::getHashRecord(int index)
{
    if(index < 0 || index >= static_cast<int>(HashRecord.size())) return std::vector<int>();
    else return HashRecord[index];
}

//Returns a set of FeatVec objects
std::vector<FeatVec> Tracker::getFeatRecord(int index)
{
    if(index >= 0 && index < static_cast<int>(FeatureRecord.size()))
    {
        return FeatureRecord[index];
    }
    else
    {
        return std::vector<FeatVec>();
    }
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------
// 	CLASSIFIER CLASS METHODS
//------------------------------------------------------------------------------------------------------------------------------------------------------------

//Default constructor
Classifier::Classifier()
{
    
}

//Initialized constructor that loads a data set of labeled feature vectors
Classifier::Classifier(std::string str)
{
    std::ifstream infile;
    infile.open(str);

    //If couldn't open file, finish here
    if(!infile.is_open()) return;

    //Clear tha DataStorage vectors
    DataStorage.clear();
    DataStorageLabel.clear();
    LabelSet.clear();

    //Read the size of the data set
    int size;
    infile >> size;

    //Read every pattern from the data set
    for(int i = 0; i < size; i++)
    {
        //Read the features
        int area;
        float circlearea;
        int contourlenght;
	float aspectRatio;
        int label;

        //Read the features
        infile >> area;
        infile >> circlearea;
        infile >> contourlenght;
	infile >> aspectRatio;
        infile >> label;

        //Store the feature vector and its label
        FeatVec fv(area,circlearea,contourlenght,aspectRatio);
        DataStorage.push_back(fv);
        DataStorageLabel.push_back(label);
    }

    //Get the set of different labels inside DataStorageLabel
    for(unsigned int i = 0; i < DataStorageLabel.size(); i++)
    {
	if(find(LabelSet.begin(),LabelSet.end(),DataStorageLabel[i]) == LabelSet.end())
	{
	    LabelSet.push_back(DataStorageLabel[i]);
	}
    }

    //Close the file
    infile.close();
}

//Public method that classifies every blob
void Classifier::classify(std::vector<FeatVec> &fv, float threshold, float areaNorm, float contNorm)
{
    if(DataStorage.size() > 0)
    {
        //classify only if there are patterns stored

        //Get all the different labels
        std::vector<int> labels;
        for(unsigned int i = 0; i < DataStorageLabel.size(); i++)
        {
            bool alreadyIn = false;
            for(unsigned int j = 0; j < labels.size(); j++)
            {
                if(labels[j] == DataStorageLabel[i])
                {
                    alreadyIn = true;
                    break;
                }
            }

            if(!alreadyIn)
            {
                labels.push_back(DataStorageLabel[i]);
            }
        }

        //labels vector
        std::vector<int> result;
        result.resize(fv.size());

        //Compute the similarty between the i-th object and every pattern
        for(unsigned int i = 0; i < fv.size(); i++)
        {

            std::vector<float> grades;
            for(unsigned int j = 0; j < DataStorage.size(); j++)
            {
                float grade = fv[i].similarity(DataStorage[j],areaNorm,contNorm);
                grades.push_back(grade);
            }

            //Get the highest grade on each class
            std::vector<float> highestGrade(labels.size(),0.0);
            //highestGrade.resize(labels.size());
            for(unsigned int j = 0; j < labels.size(); j++)
            {
                for(unsigned int k = 0; k < DataStorageLabel.size(); k++)
                {
                    if(grades[k] > highestGrade[j] && DataStorageLabel[k] == labels[j])
                    {
                        highestGrade[j] = grades[k];
                    }
                }
            }

            //Get the grades of the top-2 classes
            int index;
            float g1 = 0, g2 = 0;
            for(unsigned int j = 0; j <= highestGrade.size(); j++)
            {
                if(j == 0)
                {
                    if(highestGrade[j] > g1)
                    {
                        g1 = highestGrade[j];
                        index = j;
                    }
                }
                else if(j > 0 && j < highestGrade.size())
                {
                    if(highestGrade[j] > g1)
                    {
                        g1 = highestGrade[j];
                        index = j;
                    }

                    if(highestGrade[j-1] > g2 && highestGrade[j-1] < g1) g2 = highestGrade[j-1];
                }
                else if(j == highestGrade.size())
                {
                    if(highestGrade[j-1] > g2 && highestGrade[j-1] < g1) g2 = highestGrade[j-1];
                }
            }

            //Evaluate the two highest grades to label the object
            if(g1 - g2 > threshold)
            {
                result[i] = labels[index];
            }
            else
            {
                result[i] = 0;
            }
        }

        ClassifyResult = result;
    }
}

//Public method that draws a class label on every blob
void Classifier::drawClass(cv::Mat &img, std::vector<cv::Point> &centroid)
{
    //Check that the number of centroid points and vectors computed is the same
    if(ClassifyResult.size() != centroid.size() || img.empty()) return;

    //Draw the label to which every blob currently belongs
    for(unsigned int i = 0; i < ClassifyResult.size(); i++)
    {
        //Draw the label from the ClassifyResult vector
        std::ostringstream strs;
        strs << ClassifyResult[i];
        std::string str = strs.str();
        cv::putText(img,str,centroid[i],CV_FONT_HERSHEY_SIMPLEX,0.7,cv::Scalar(255,0,0));
    }
}

//Public method to add a FeatureVector and its class label in the DataStorage vectors
void Classifier::store(FeatVec fv, int label)
{
    if(label > 0)
    {
        DataStorage.push_back(fv);
        DataStorageLabel.push_back(label);
    }
}

//Public method that clears the DataStorage vector
void Classifier::reset()
{
    DataStorage.clear();
    DataStorageLabel.clear();
}

//Public method that saves a set of labeled feature vectors in the hard drive
bool Classifier::save(std::string str)
{
    std::ofstream outfile;
    outfile.open(str);

    //if error opening file or no data to save, finish here
    if(!outfile.is_open() || DataStorage.size() == 0) return false;

    //Set a fixed precision
    outfile << std::fixed;

    //Write the number of vectors to save
    outfile << DataStorage.size() << std::endl;

    //Write feature values and the label of the class it belong
    for(unsigned int i = 0; i < DataStorage.size(); i++)
    {
        outfile << DataStorage[i].area() << std::endl;
        outfile << DataStorage[i].circa() << std::endl;
        outfile << DataStorage[i].cont() << std::endl;
	outfile << DataStorage[i].aspect() << std::endl;
        outfile << DataStorageLabel[i] << std::endl;
    }

    //Close file
    outfile.close();

    return true;
}

//Public method that loads a labeled data set of feature vectors
bool Classifier::load(std::string str)
{
    std::ifstream infile;
    infile.open(str);

    //If couldn't open file, finish here
    if(!infile.is_open()) return false;

    //Clear tha DataStorage vectors
    DataStorage.clear();
    DataStorageLabel.clear();
    LabelSet.clear();

    //Read the size of the data set
    int size;
    infile >> size;

    //Read every pattern from the data set
    for(int i = 0; i < size; i++)
    {
        //Read the features
        int area;
        float circlearea;
        int contourlenght;
	float aspectRatio;
        int label;

        //Read the features
        infile >> area;
        infile >> circlearea;
        infile >> contourlenght;
	infile >> aspectRatio;
        infile >> label;

        //Store the feature vector and its label
        FeatVec fv(area,circlearea,contourlenght,aspectRatio);
        DataStorage.push_back(fv);
        DataStorageLabel.push_back(label);
    }

    //Get the set of different labels inside DataStorageLabel
    for(unsigned int i = 0; i < DataStorageLabel.size(); i++)
    {
	if(find(LabelSet.begin(),LabelSet.end(),DataStorageLabel[i]) == LabelSet.end())
	{
	    LabelSet.push_back(DataStorageLabel[i]);
	}
    }

    //Close the file
    infile.close();

    return true;
}

//Public method that returns the size of the DataStorage vector
int Classifier::dataBaseSize()
{
    return DataStorage.size();
}

//Public method to print the dataset
void Classifier::print()
{
    if(DataStorage.size() > 0)
    {
        for(unsigned int i = 0; i < DataStorage.size(); i++)
        {
            std::cout << DataStorage[i].area() << "\t";
            std::cout << DataStorage[i].circa() << "\t";
            std::cout << DataStorage[i].cont() << "\t";
	    std::cout << DataStorage[i].aspect() << "\t";
            std::cout << DataStorageLabel[i] << "\n";
        }
    }
}

//Public method that returns the feature vector
std::vector<FeatVec> Classifier::getf()
{
    if(DataStorage.size() == 0)
        return std::vector<FeatVec>();
    else
        return DataStorage;
}

//Public method that returns the label vector
std::vector<int> Classifier::getl()
{
    if(DataStorageLabel.size() == 0)
        return std::vector<int>();
    else
        return DataStorageLabel;
}

//Public method which classifies based only on compactness and aspect ratio features
int Classifier::classify2(FeatVec fv, float aspectNorm, float threshold)
{
	//Compute the similarity to each database vector
	std::vector<float> grades;
	for(unsigned int i = 0; i < DataStorage.size(); i++)
	{
		float grade = fv.similarity2(DataStorage[i],aspectNorm);
		grades.push_back(grade);
	}

	//Get the highest grade from each class
	std::vector<float> highestGrades(LabelSet.size(),0.0);
	for(unsigned int i = 0; i < highestGrades.size(); i++)
	{
		for(unsigned int j = 0; j < grades.size(); j++)
		{
			if(LabelSet[i] == DataStorageLabel[j] && highestGrades[i] < grades[j]) highestGrades[i] = grades[j];
		}
	}

	//Get the highest 2 classes
	int index = 0;
	float g1 = 0, g2 = 0;
	for(unsigned int i = 0; i < highestGrades.size(); i++)
	{
		if(i == 0)
		{
		    if(highestGrades[i] > g1)
		    {
			g1 = highestGrades[i];
			index = i;
		    }
		}
		else if(i > 0 && i < highestGrades.size())
		{
		    if(highestGrades[i] > g1)
		    {
			g1 = highestGrades[i];
			index = i;
		    }

		    if(highestGrades[i-1] > g2 && highestGrades[i-1] < g1) g2 = highestGrades[i-1];
		}
		else if(i == highestGrades.size())
		{
		    if(highestGrades[i-1] > g2 && highestGrades[i-1] < g1) g2 = highestGrades[i-1];
		}
	}

	//Return the predicted label or 0, which stands for undefined
	if(g1 - g2 > threshold) return LabelSet[index];
	else return 0;
}

//Public method to return the set of all different labels
std::vector<int> Classifier::getls()
{
	return LabelSet;
}

//Public method to return a vector containing the labels result of this classification
std::vector<int> Classifier::getResult()
{
	return ClassifyResult;
}

//Public method to classify a vector of objects based only on compactness and aspect ratio features
void Classifier::classify3(std::vector<FeatVec> &fv, float aspectNorm, float threshold)
{
    if(DataStorage.size() > 0)
    {
        //classify only if there are patterns stored

        //Get all the different labels
        std::vector<int> labels;
        for(unsigned int i = 0; i < DataStorageLabel.size(); i++)
        {
            bool alreadyIn = false;
            for(unsigned int j = 0; j < labels.size(); j++)
            {
                if(labels[j] == DataStorageLabel[i])
                {
                    alreadyIn = true;
                    break;
                }
            }

            if(!alreadyIn)
            {
                labels.push_back(DataStorageLabel[i]);
            }
        }

        //labels vector
        std::vector<int> result;
        result.resize(fv.size());

        //Compute the similarty between the i-th object and every pattern
        for(unsigned int i = 0; i < fv.size(); i++)
        {

            std::vector<float> grades;
            for(unsigned int j = 0; j < DataStorage.size(); j++)
            {
                float grade = fv[i].similarity2(DataStorage[j],aspectNorm);
                grades.push_back(grade);
            }

            //Get the highest grade on each class
            std::vector<float> highestGrade(labels.size(),0.0);
            //highestGrade.resize(labels.size());
            for(unsigned int j = 0; j < labels.size(); j++)
            {
                for(unsigned int k = 0; k < DataStorageLabel.size(); k++)
                {
                    if(grades[k] > highestGrade[j] && DataStorageLabel[k] == labels[j])
                    {
                        highestGrade[j] = grades[k];
                    }
                }
            }

            //Get the grades of the top-2 classes
            int index;
            float g1 = 0, g2 = 0;
            for(unsigned int j = 0; j <= highestGrade.size(); j++)
            {
                if(j == 0)
                {
                    if(highestGrade[j] > g1)
                    {
                        g1 = highestGrade[j];
                        index = j;
                    }
                }
                else if(j > 0 && j < highestGrade.size())
                {
                    if(highestGrade[j] > g1)
                    {
                        g1 = highestGrade[j];
                        index = j;
                    }

                    if(highestGrade[j-1] > g2 && highestGrade[j-1] < g1) g2 = highestGrade[j-1];
                }
                else if(j == highestGrade.size())
                {
                    if(highestGrade[j-1] > g2 && highestGrade[j-1] < g1) g2 = highestGrade[j-1];
                }
            }

            //Evaluate the two highest grades to label the object
            if(g1 - g2 > threshold)
            {
                result[i] = labels[index];
            }
            else
            {
                result[i] = 0;
            }
        }

        ClassifyResult = result;
    }

}

bool Classifier::classify4(std::vector<FeatVec> &fv,std::vector<float> &params)
{
    //params[0]: Use area in the classification
    //params[1]: Use compactness in the classification
    //params[2]: Use contour length in the classification
    //params[3]: Use aspect ratio in the classification
    //params[4]: area normalize value
    //params[5]: contour normalize value
    //params[6]: aspect normalize value
    //params[7]: single class threshold
    //params[8]: multi class threshold
    if(params.size() != 9) return false;
    for(unsigned int i = 0; i < params.size(); i++) if(params[i] < 0) return false;
    int nfeatures = static_cast<int>(params[0])+static_cast<int>(params[1])+static_cast<int>(params[2])+static_cast<int>(params[3]);
    if(nfeatures == 0 || nfeatures > 4) return false;

    std::vector<int> result(fv.size(),0);

    for(unsigned int i = 0; i < fv.size(); i++)
    {
        std::vector<float> grades;
        for(unsigned int j = 0; j < DataStorage.size(); j++)
        {
            float grade = fv[i].similarity4(DataStorage[j],params);
            grades.push_back(grade);
        }

        
        if(LabelSet.size() == 1)
        {
            //There is a single class stored in the database

            //Get the best match for the input object
            float highestGrade = 0.0;
            for(unsigned int j = 0; j < grades.size(); j++)
            {
                if(grades[j] > highestGrade) highestGrade = grades[j];
            }

            //Evaluate the best match against the threshold in order to assign the predicted label
            if(highestGrade > params[7]) result[i] = LabelSet[0];
        }
        else if(LabelSet.size() > 1)
        {
            //There are several classes stored in the database

            //Get the highest grade or best match from each class on the input object
            std::vector<float> highestGrade(LabelSet.size(),0.0);
            for(unsigned int j = 0;  j < LabelSet.size(); j++)
            {
                for(unsigned int k = 0; k < DataStorageLabel.size(); k++)
                {
                    if(grades[k] > highestGrade[j] && DataStorageLabel[k] == LabelSet[j])
                    highestGrade[j] = grades[k];
                }
            }

            //Get the grades of the top-2 classes
            int index = -1;
            float g1 = 0.0, g2 = 0.0;
            for(unsigned int j = 0; j <= highestGrade.size() ; j++)
            {
                if(j == 0)
                {
                    if(highestGrade[j] > g1)
                    {
                        g1 = highestGrade[j];
                        index = j;
                    }
                }
                else if(j > 0 && j < highestGrade.size())
                {
                    if(highestGrade[j] > g1)
                    {
                        g1 = highestGrade[j];
                        index = j;
                    }

                    if(highestGrade[j-1] > g2 && highestGrade[j-1] < g1) g2 = highestGrade[j-1];
                }
                else if(j == highestGrade.size())
                {
                    if(highestGrade[j-1] > g2 && highestGrade[j-1] < g1) g2 = highestGrade[j-1];
                }
            }

            //Evaluate the two highest grades to label the object
            if(g1 - g2 > params[8]) result[i] = LabelSet[index];
        }
    }

    ClassifyResult = result;

    return true;
}

int Classifier::maxArea()
{
    float max = 0;
    for(unsigned int i = 0; i < DataStorage.size(); i++)
    {
        std::vector<float> features = DataStorage[i].get();
        if(features[0] > max) max = features[0];
    }

    return static_cast<int>(max);
}

int Classifier::maxContour()
{
    float max = 0;
    for(unsigned int i = 0; i < DataStorage.size(); i++)
    {
        std::vector<float> features = DataStorage[i].get();
        if(features[2] > max) max = features[2];
    }

    return static_cast<int>(max);
}

//Public method to get the greatest Aspect Ratio value from the database
float Classifier::maxAspect()
{
	if(DataStorage.size() == 0) return 0.0;
	else
	{
		float greatest = 0;
		for(unsigned int i = 0; i < DataStorage.size(); i++)
		{
			if(DataStorage[i].aspect() > greatest) greatest = DataStorage[i].aspect();
		}
		return greatest;
	}
}

void Classifier::computeLabelSet()
{
    //Get the set of different labels inside DataStorageLabel
    LabelSet.clear();
    for(unsigned int i = 0; i < DataStorageLabel.size(); i++)
    {
        if(find(LabelSet.begin(),LabelSet.end(),DataStorageLabel[i]) == LabelSet.end())
        {
            LabelSet.push_back(DataStorageLabel[i]);
        }
    }
}




