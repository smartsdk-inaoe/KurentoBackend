/**
  * @file VPDetector.hpp
  * @version 1.0
  * @date 26/03/2017
  * @author Sergio A. Serrano
  * @title Vehicle & Person Detector
  * @brief This file contains a set of classes and functions useful for tracking and classification tasks on binary images, i.e. images containing blobs. The first two functions are used for feature extraction. The "FeatVec" class is used to contain the specific set of features we are interested on, for later classification. The "Tracker" class has multi-object tracking capabilities on binary objects (blobs). The "classifier" is used for classifying objects into "N" classes. The variable "N" is defined by the dataset loaded.
  */

#include <vector>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <opencv2/opencv.hpp>
#include <cmath>
#include <algorithm>
#include <sstream>
#include <fstream>

#ifndef VPDETECTOR_HPP
#define VPDETECTOR_HPP

/**
 * @brief Takes for input an 8-bit single channel image. An unique integer value (label) will be assigned to each blob, then every pixel's value will be changed to the label of the blob this pixel belongs to. If needed, make a copy of the input image before passing it to this function, because this image will be modified.
 * @param img Reference to an 8-bit single channel image
 * @return Number of blobs found in img
 */
int labelBlobs(cv::Mat &img);

/**
 * @brief Takes for input an 8-bit single channel image. An unique integer value (label) will be assigned to each blob, then every pixel's value will be changed to the label of the blob this pixel belongs to. If needed, make a copy of the input image before passing it to this function, because this image will be modified. The difference between this function and 'labelBlobs' is that this function deletes those blobs whose area is less than the second parameter.
 * @param img Reference to an 8-bit single image
 * @param minSize Minimum area size a blob must have in order it does not get deleted
 * @return Number of blob with an area size greater than 'minSize' found in 'img'
 */
int labelBigBlobs(cv::Mat &img, int minSize);

/**
 * @brief Takes for input an 8-bit single channel image where every non-zero pixel has been previously labeled to a specific blob. Then each blob's centroid, area, radius and contour lenght, is computed and stored in the input vectors.
 * @param img Reference to an 8-bit single channel image
 * @param centroid Reference to a cv::Point vector
 * @param area Reference to an int vector
 * @param radius Reference to a float vector
 * @param contourLenght Reference to vector that holds vectors of cv::Point instances
 * @return If the extraction task is successfully completed then a true value is returned, otherwise a false is returned
 */
bool area_centroid_radius(cv::Mat &img, std::vector<cv::Point> &centroid, std::vector<int> &area, std::vector<float> &radius, std::vector<int> &contourLenght, std::vector<cv::Rect> &boxes);

/**
 * @brief Takes for input an 8-bit single channel image where every non-zero pixel has been previously labeled to a specific blob. Then each blob's centroid, area, radius and contour lenght, is computed and stored in the input vectors.
 * @param img Reference to an 8-bit single channel image
 * @param centroid Reference to a cv::Point vector
 * @param area Reference to an int vector
 * @param radius Reference to a float vector
 * @param contourLenght Reference to vector that holds vectors of cv::Point instances
 * @param boxes Reference to a cv::Rect vector
 * @param seed Reference to a cv::Point vector that holds points that are guaranteed to be inside its corresponding blob, something that cannot be said about those inside 'centroid'
 * @return If the extraction task is successfully completed then a true value is returned, otherwise a false is returned
 */
bool featureExtraction(cv::Mat &img, std::vector<cv::Point> &centroid, std::vector<int> &area, std::vector<float> &radius, std::vector<int> &contourLenght, std::vector<cv::Rect> &boxes, std::vector<cv::Point> &seed);

/**
 * @brief The FeatVec class is used to contain a set of features required for a later classification process. This set is composed by the area, compactness and contour lenght of a blob. Here we define the compactness as the ratio of the area of the shape and the area of the minimum enclosing circle for this shape. This class also eases its interaction by providing several useful methods.
 */
class FeatVec
{
	private:

    int Area;
    float AreaCircle;
    int ContourLenght;
    float AspectRatio;

	public:

    /**
     * @brief Default constructor. Sets the object's parameters to their default value, i.e. 0.
     */
    FeatVec();

    /**
     * @brief Overloaded constructor. Initializes the object's parameters with values passed as input. Input arguments are verified for contanining valid values, if so they are used, otherwise default values are used.
     * @param area Area of the blob
     * @param areaCircle Compactness of the blob
     * @param contourLenght Contour lenght of the blob
     */
    FeatVec(int area, float areaCircle, int contourLenght, float aspectRatio);

    /**
     * @brief This method is used to set the vector's parameters, but only if they pass the verification of valid values.
     * @param area Area of the blob
     * @param areaCircle Compactness of the blob
     * @param contourLenght Contour lenght of the blob
     */
    void set(int area, float areaCircle, int contourLenght, float aspectRatio);

    /**
     * @brief This method is used to access the vector's parameter values.
     * @return Returns the parameter values in the form of a float vector
     */
    std::vector<float> get();

    /**
     * @brief This method computes the euclidean distance between two FeatVec.
     * @param fv The FeatVec to which the distance will be computed
     * @return Returns the euclidean distance
     */
    float distance(FeatVec &fv);

    /**
     * @brief This method computes the similarity between two FeatVecs, where the measure ranges from 0 to 1.
     * @param fv The FeatVec to which the similarity will be computed
     * @param areaNorm A value used to normalize the Area parameters
     * @param contNorm A value used to normalize the ContourLenght parameters
     * @return Returns a float value between 0 and 1
     */
    float similarity(FeatVec &fv, float areaNorm, float contNorm);

    /**
     * @brief This method computes the similarity between two FeatVecs based only on the compactness and aspect ratio features.
     * @param fv The FeatVec to which the similarity will be computed
     * @param aspectNorm A value used to normalize the aspect ratio parameters
     * @return Returns a float value between 0 and 1
     */
    float similarity2(FeatVec &fv, float aspectNorm);

    /**
     * @brief This method computes the similarity between two FeatVecs based on the values provided in the 'params' vector, that is, modifying the values of 'params' one might define which features are to be considered in the classification task.
     * @param fv The FeatVec to which the similarity will be computed
     * @param params Reference to a vector that must be of size 9. Each of its elements have a specific functionality; params[0]: Use area in the classification, params[1]: Use compactness in the classification, params[2]: Use contour length in the classification, params[3]: Use aspect ratio in the classification, params[4]: area normalize value, params[5]: contour normalize value, params[6]: aspect normalize value, params[7]: single class threshold, params[8]: multi class threshold
     * @return Returns a float value between 0 and 1
     */
    float similarity4(FeatVec &fv, std::vector<float> &params);

    /**
     * @brief
     * @return Returns the Area parameter of this FeatVec
     */
    int area();

    /**
     * @brief
     * @return Returns the AreaCircle parameter (which is the compactness value) of this FeatVec
     */
    float circa();

    /**
     * @brief
     * @return Returns the ContourLenght
     */
    int cont();

    /**
     * @brief
     * @return Returns the AspectRatio of this FeatVec
     */
    float aspect();
};

/**
 * @brief The Tracker class is used to track multiple binary objects (blobs), linking blobs of two consecutive frames according on how likely they are to be the same object based on the distance between them.
 */
class Tracker
{
	private:

    int n;
    int m;
    int nRecords;
    std::vector<std::vector<cv::Point>> CentroidRecord;
    std::vector<std::vector<float>> RadiusRecord;
    std::vector<std::vector<FeatVec>> FeatureRecord;
    std::vector<std::vector<int>> HashRecord;
    cv::Mat Image;

	public:

    /**
     * @brief Default constructor.
     */
    Tracker();

    /**
     * @brief This method performes the tracking task on an 8-bit single channel image.
     * @param img_foreground 8-bit single channel image containing the blobs to be tracked
     */
    void track(cv::Mat &img_foreground);

    /**
     * @brief This method draws each tracked blob's position, since the last 12 frames to the current frame. It also draws the minimum enclosing circle of each blob.
     * @return Returns true if there were objects to track, otherwise returns false
     */
    bool draw();


    bool draw(cv::Mat &img);

    /**
     * @brief In order to see the tracking markers on the image, this method should be called after the draw() method is called.
     * @return Returns the input image modified by the draw() method
     */
    cv::Mat getImage();

    /**
     * @brief This method gives the amount of records saved up to the current frame, where each record contains the information of every blob tracked for that frame.
     * @return Returns the amount of saved records, which ranges from 0 to nRecords
     */
    int recordSize();

    /**
     * @brief This method returns the vector of centroids for each tracked blob in a specific frame, where the last position in the vector that contains the centroid records is the previous frame.
     * @param index Integer used to access a centroid vector from the saved records
     * @return Returns a cv::Point vector
     *
     * @code
     * //Assume you have a Tracker instance named 'tracker'
     * //Get vector from the previous frame
     * std::vector<cv::Point> prevCentroids = tracker.getCentroidRecord(tracker.recordSize() - 1);
     *
     * //Get vector from the oldest saved frame
     * std::vector<cv::Point> oldestCentroids = tracker.getCentroidRecord(0);
     * @endcode
     */
    std::vector<cv::Point> getCentroidRecord(int index);

    /**
     * @brief This method returns the vector of minimum enclosing circle's radius for each tracked blob in a specific frame, where the last position in the vector that contains the radius records is the previous frame.
     * @param index Integer used to access a radius vector from the saved records
     * @return Returns a float vector
     *
     * @code
     * //Get vector from the previous frame
     * std::vector<float> prevRadius = tracker.getRadiusRecord(tracker.recordSize() - 1);
     *
     * //Get vector from the oldest saved frame
     * std::vector<float> oldestRadius = tracker.getRadiusRecord(0);
     * @endcode
     */
    std::vector<float> getRadiusRecord(int index);

    /**
     * @brief This method returns a vector that relates the blobs from two consecutive records.
     * @param index Integer used to access a hash vector
     * @return Returns a int vector
     *
     * @code
     * //Here coordA and coordB hold the centroid coordinate of the same object from different frames, where coordA is from frame (t) and coordB from frame (t+1)
     * std::vector<int> hash = tracker.getHashRecord(3);
     * std::vector<cv::Point> centroidsA = tracker.getCentroidRecord(3);
     * std::vector<cv::Point> centroidsB = tracker.getCentroidRecord(4);
     * cv::Point coordA = centroidsA[ 0 ];
     * cv::Point coordB = centroidsB[ hash[0] ];
     * @endcode
     */
    std::vector<int> getHashRecord(int index);

    /**
     * @brief This method returns the vector of feature vectors for each tracked blob in a specific frame, where the last position in the vector that contains the radius records is the previous frame.
     * @param index Integer used to access a FeatVec vector from the saved records
     * @return Returns a FeatVec vector
     *
     * @code
     * //Get vector from the previous frame
     * std::vector<FeatVec> prevFeat = tracker.getFeatRecord(tracker.recordSize() - 1);
     *
     * //Get vector from the oldest saved frame
     * std::vector<FeatVec> oldestFeat = tracker.getFeatRecord(0);
     * @endcode
     */
    std::vector<FeatVec> getFeatRecord(int index);

    
};

/**
 * @brief The Classifier class is used to classify objects based on the measurements that define the FeatVec and a similarity metric, as well defined in the FeatVec class. This class loads a dataset from a '.dat' file, which is also generated from this class.
 */
class Classifier
{
	private:

    std::vector<int> ClassifyResult;
    std::vector<FeatVec> DataStorage;
    std::vector<int> DataStorageLabel;
    std::vector<int> LabelSet;

	public:

    /**
     * @brief Default constructor.
     */
    Classifier();

    /**
     * @brief Overloaded constructor which initializes the classifier loading a dataset.
     * @param str Path to the dataset file
     */
    Classifier(std::string str);

    /**
     * @brief This method classifies every object in the fv vector, using a Nearest Neighbor approach with an extra condition in order to get a positive match, that is that the difference between the best and second best match should be greater than the given threshold.
     * @param fv Vector that contains every object's feature vector to be classified
     * @param threshold Threshold value to be surpassed in order to get a positive match
     * @param areaNorm Value to normalize the area parameter
     * @param contNorm Value to normalize the contour lenght parameter
     */
    void classify(std::vector<FeatVec> &fv, float threshold, float areaNorm, float contNorm);

    /**
     * @brief This method draws the label assigned to each object. A 0 means the object didn't match any class.
     * @param img Image where class labels will be drawn
     * @param centroid Vector containing the centroid coordinates of the classified objects
     */
    void drawClass(cv::Mat &img, std::vector<cv::Point> &centroid);

    /**
     * @brief This method adds a feature vector and its corresponding class label to the classifier's dataset.
     * @param fv Feature vector to be added
     * @param label Feature vector's class label
     */
    void store(FeatVec fv, int label);

    /**
     * @brief This method erases the classifier's dataset.
     */
    void reset();

    /**
     * @brief This method saves the classifier's current dataset in a '.dat' file
     * @param str Path where the dataset file will be saved
     * @return Returns true if the saving task is completed succesfully, otherwise it returns false
     */
    bool save(std::string str);

    /**
     * @brief This method loads a dataset from a '.dat' file.
     * @param str Path to the dataset file
     * @return Returns true if the loading task is completed succesfully, otherwise it returns false
     */
    bool load(std::string str);

    /**
     * @brief This method gives access to the classifier's current dataset size.
     * @return Returns the size of the classifier's current dataset
     */
    int dataBaseSize();

    /**
     * @brief This method prints the dataset elements along with their class label.
     */
    void print();

    /**
     * @brief This method gives access to the current dataset.
     * @return Returns the current dataset
     */
    std::vector<FeatVec> getf();

    /**
     * @brief This method gives access to the labels of every element contained in the current dataset.
     * @return Returns the dataset labels
     */
    std::vector<int> getl();

    /**
     * @brief This method classifies vector based only on the compactness and aspect ratio features.
     * @param fv Feature vector to be classified
     * @param aspectNorm Value to normalize the aspect ratio features
     * @return Returns the class label predicted by the classifier
     */
    int classify2(FeatVec fv, float aspectNorm, float threshold);

    /**
     * @brief This method returns the set of all different labels.
     * @return Vector of class labels
     */
    std::vector<int> getls();

    /**
     * @brief This method returns a vector containing the labels result of the last classification.
     * @return  Vector of class labels
     */
    std::vector<int> getResult();

    /**
     * @brief This method performs classification on a vector of FeatVec objects based only on compactness and aspect ratio features.
     * @param fv Vector that contains every object's feature vector to be classified
     * @param aspectNorm Value to normalize the aspect ratio parameter
     * @param threshold Threshold value to be surpassed in order to get a positive match
     */
    void classify3(std::vector<FeatVec> &fv, float aspectNorm, float threshold);

    /**
     * @brief This method returns the maximum value of aspect ratio in the database.
     * @return Maximum aspect ratio value in the database
     */
    float maxAspect();

    /**
     * @brief This method performs classification on a vector of FeatVec objects based on the values provided in the 'params' vector, that is, modifying the values of 'params' one might define which features are to be considered in the classification task.
     * @param fv Vector that contains every object's feature vector to be classified
     * @param params Reference to a vector that must be of size 9. Each of its elements have a specific functionality; params[0]: Use area in the classification, params[1]: Use compactness in the classification, params[2]: Use contour length in the classification, params[3]: Use aspect ratio in the classification, params[4]: area normalize value, params[5]: contour normalize value, params[6]: aspect normalize value, params[7]: single class threshold, params[8]: multi class threshold
     * @return True if the classification was successfully done, False otherwise
     */
    bool classify4(std::vector<FeatVec> &fv, std::vector<float> &params);

    /**
     * @brief This method returns the maximum value of area in the database.
     * @return Maximum area value in the database
     */
    int maxArea();

    /**
     * @brief This method returns the maximum value of contour length in the database.
     * @return Maximum contour length in the database
     */
    int maxContour();

    /**
     * @brief This method computes the set of different labels inside DataStorageLabel, avoiding repetitions.
     */
    void computeLabelSet();
};

#endif
