extends Node2D

var a: float = -1.0
var b: float = 1.0
var num_points: int = 100
var ascale: float = 100.0  # Adjust this value to better fit the screen

func _ready():
	# Center the parent node on the screen
	
	# Generate the curve points and set the polygon
	var curve_points = generate_elliptic_curve()
	$Polygon2D.polygon = curve_points
	$Polygon2D.color = Color(1, 0, 0, 1)  # Bright red color for visibility
	print(curve_points)

func generate_elliptic_curve():
	var points := []
	var points2 := []
	for i in range(num_points):
		var x = lerp(-2.0, 2.0, float(i) / (num_points - 1))
		var term = x * x * x + a * x + b
		if term >= 0:
			var y = sqrt(term)
			# Scale and center the points around the origin (0, 0)
			points.append(Vector2(x, y) * ascale)
			points2.append(Vector2(x, -y) * ascale)  
	for i in range(points2.size() - 1, -1, -1):
		points.append(points2[i])
	return points
