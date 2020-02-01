# Godot Vector Resource

A [Godot Engine](https://github.com/godotengine/godot) plugin which introduces a
new `VectorResource` type and an accompanying editor. These allow to store
vectors externally and conveniently edit `Vector2/3` core data types as
regular resources which can be shared between multiple instances.

![Vector Resource Inspector](images/vector-resource-inspector.png)

The plugin provides a way to edit any `Vector2` and `Vector3` by creating and
modifying a `VectorResource`:

![Vector Create New Resource Button](images/vector-create-new-resource-button.png)

![Vector Create New Resource](images/vector-create-new-resource.png)

Then you can edit the vector visually given the following planes/components: 

* Front/XY
* Top/XZ
* Side/ZY

![Vector Resource Inspector](images/vector-editing.gif)

Normalized (unit) vectors are possible to set with the `snapped` option and 
different `grid_step`, allowing to set unit vectors with different aspect ratios,
and any other vector can be set given its `max_length` starting from origin.
