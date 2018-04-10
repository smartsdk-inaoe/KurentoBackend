import requests
import json

#----------------------------------------------------------------------------------------------------------------------------------------
#These are the Orion Context Broker (OCB) address and port
#You might need to modify them in order to make it work in your application
host = "192.168.56.101"
port = 1026
headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}

#----------------------------------------------------------------------------------------------------------------------------------------
#Function: insert_json_entity
#Description: This function takes a json file, where a entity is describe, and it updates or adds this entity
#to the OCB.
def insert_json_entity(json_file):
	data = open(json_file).read()
	json_data = json.loads(data)
	response = requests.post("http://{0}:{1}/v1/updateContext".format(host,port),headers=headers,data=json.dumps(json_data))
	result = str(json.dumps(response.json()))
	done = [result]
	return list(done)

#----------------------------------------------------------------------------------------------------------------------------------------
#Function: add_json_entity
#Description: This function is used for adding entities to the OCB by calling "insert_json_entity"
def add_json_entity(json_file):
	return insert_json_entity(json_file)

#----------------------------------------------------------------------------------------------------------------------------------------
#Function: update_json_entity
#Description: This function is used for updating entities inside the OCB by calling "insert_json_entity" 
def update_json_entity(json_file):
	return insert_json_entity(json_file)

#----------------------------------------------------------------------------------------------------------------------------------------
#Function: query_json_entity
#Description: This function queries a specific entity that exists inside the OCB, by providing the ID and TYPE of that entity
def query_json_entity(json_id,json_type):
	json_data = {
        "entities":[
        {
                "type": json_type,
                "isPattern": "false",
                "id": json_id
        }
        ]
        }

	response = requests.post("http://{0}:{1}/v1/queryContext".format(host,port), headers = headers,data = json.dumps(json_data))

	json_test = response.json()
	attlist = ["init"]
	for attr in json_test['contextResponses'][0]['contextElement']['attributes']:
		attlist.append(attr['name'])
		attlist.append(attr['type'])
		attlist.append(attr['value'])
	del attlist[0]

	return list(attlist)

#----------------------------------------------------------------------------------------------------------------------------------------
#Function: delete_json_entity
#Description: This function deletes a specific entity that exists inside the OCB, by providing this entity's ID
def delete_json_entity(json_id):
	response = requests.delete("http://{0}:{1}/v1/contextEntities/{2}".format(host,port,json_id),headers=headers)
	result = str(json.dumps(response.json()))
	done = [result]
	return list(done)

#----------------------------------------------------------------------------------------------------------------------------------------
#Function: add_subscription
#Description: This function registers a subscription to some existing entity inside the OCB, by providing a json file. It also
#creates an entity of TYPE "Subscription" that holds important info of such subscription, just in case one might want to delete it.
def add_subscription(json_file):
	input_data = open(json_file).read()
	json_data = json.loads(input_data)
	response = requests.post("http://{0}:{1}/v1/subscribeContext".format(host,port),headers=headers,data=json.dumps(json_data))
	json_result = response.json()
	sub_id = json_result['subscribeResponse']['subscriptionId']
	sub_data = {
        "contextElements":[
        {
                "type": "Subscription",
                "isPattern": "false",
                "id": sub_id,
                "attributes": [
                {
                        "name":"subscriptionId",
                        "type": "string",
                        "value": sub_id
                },
		{
			"name":"ownerType",
			"type":"string",
			"value":json_data["entities"][0]["type"]
		},
		{
			"name":"ownerId",
			"type":"string",
			"value":json_data["entities"][0]["id"]
		}
        ]
        }
        ],
        "updateAction": "APPEND"
        }
	requests.post("http://{0}:{1}/v1/updateContext".format(host,port),headers=headers,data=json.dumps(sub_data))
	result = str(json.dumps(json_result))
	done = [result]
	return list(done)

#----------------------------------------------------------------------------------------------------------------------------------------
#Function: delete_subscription
#Description: This function deletes a subscription and its corresponding "Subscription" entity, by providing this subscription's ID.
def delete_subscription(json_id):
	result1 = requests.delete("http://{0}:{1}/v1/contextSubscriptions/{2}".format(host,port,json_id),headers=headers)
	result2 = requests.delete("http://{0}:{1}/v1/contextEntities/{2}".format(host,port,json_id),headers=headers)
	result = str(json.dumps(result1.json()))
	done = [result]
	return list(done)
	
#----------------------------------------------------------------------------------------------------------------------------------------
