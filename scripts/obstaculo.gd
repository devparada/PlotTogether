extends RigidBody3D

var push_force = 40.0
var player = null  # Referencia al jugador
var has_pushed = false

# Función que se ejecuta cada frame para mover el obstáculo
func _physics_process(delta):
	if player != null and not has_pushed:
		# Obtén la dirección del movimiento del jugador
		var direction = (player.global_transform.origin - global_transform.origin).normalized()
		apply_central_impulse(direction * push_force)
		has_pushed = true

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:  # Verifica si el cuerpo es el jugador
		player = body

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body == player:
		player = null
		has_pushed = false
