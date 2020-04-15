extends Control

var dateURL = "http://date.jsontest.com/"

func _ready():
	pass

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var json = JSON.parse(body.get_string_from_utf8())
		var r = json.result
		$Date.text = "It is now " + str(r["time"]) + " (GMT) on " + str(r["date"])
	else:
		$Date.text = "The request failed (error code %d)" % response_code

func _on_Button_pressed():
	$HTTPRequest.request(dateURL)