class_name SmokeTest
extends GdUnitTestSuite


func test_project_name_is_available() -> void:
	var main := auto_free(load("res://scripts/main.gd").new())

	assert_str(main.template_name()).is_equal("GodotGameTemplate")
