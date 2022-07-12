Pannable Camera
======

Script(s) for a pannable and zoomable Camera2D

Here I have two versions, the first having pre-defined controls (this makes it easier to drop it into a Camera2D's script and having something functional off the bat) and the second having inputs taken from the Input Map, leaving you to add corresponding inputs manually.

Files
------

Thing | Description
--- | ---
[Pre-Defined Camera](/PannableCamera/pre_defined.gd) | Uses middle mouse button for panning, and up and down scroll for zooming in and out respectively.
[Input Map Camera](/PannableCamera/input_map.gd) | Uses `camera_pan` for panning, with `camera_zoom_in` & `camera_zoom_out` for zooming.