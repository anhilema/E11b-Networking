# E11b-Networking
A simple example of a HTTP request in Godot.

This should be a super-simple opportunity for you to see how to make a HTTP request from within Godot. For this example, we will be using a JSON testing tool: [jsontest.com](http://www.jsontest.com)

As usual, fork and clone this repository. It is pretty empty to start with. When it has been cloned to your computer, open the project.godot file.

 * Create a new Root Node. Select User Interface
 * Right-click on the Control node, and Add Child Node. Select a Button node
 * Right-click on the Control node, and add a Label. Rename the Label node to Date
 * Right-click on the Control node, and add a HTTPRequest
 * Right-click on the Control node, and Attach Script. Select Template: Empty, and save it to res://Control.gd
 * Select the Date node; in the Inspector, change Label->Text=What time is it?
   * Label->Align=Center
   * Control->Rect->Position.y=128
   * Control->Rect->Size.x=1024, y=100
 * Select the Button node; in the Inspector, change Button->Text=Check time
   * Control->Rect->Position.x=470, y=300
   * Control->Rect->Size.x=84, y=20
 * With the Button node selected, open the Node panel
   * Add a new signal for pressed(). Attach the signal to Control.gd
 * Select the HTTPRequest node, and open the Node panel
   * Add a new signal for request_completed. Attach the signal to Control.gd
 * Open Control.gd, and replace its contents with the following:
```
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

```
(Make sure you indent with tabs)

Save the scene as Control.tscn. Run the program, and push the button. Make sure the label updates to the current time and date (in GMT).

When you are completed, update the README.md and the LICENSE. Commit and Push your changes back to Github, and turn the URL of your repository in on Canvas.
