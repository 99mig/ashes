shader_type canvas_item;

/* ------------------------------------------------------------------
   PARÁMETROS
   ------------------------------------------------------------------*/
uniform float iso_scale : hint_range(0.1, 4.0) = 1.0;  // Escala global
uniform vec2  sprite_size = vec2(128.0, 128.0);        // (ancho, alto)

/* Proyección dimétrica clásica – 30 °               */
const float COS_ANGLE = 0.8560254;   // cos 30 °
const float SIN_ANGLE = 0.6;         // sin 30 °

/* ------------------------------------------------------------------
   VÉRTEX – proyección X + Z
   ------------------------------------------------------------------*/
void vertex () {
	/* 1) Origen en la base‑centro del sprite  */
	vec2 pos = VERTEX - vec2(sprite_size.x * 0.5,  // mitad del ancho
	                         sprite_size.y);       // base (parte baja)

	/* 2) Mapeo de ejes:  x = profundidad,  z = altura               */
	float x = pos.x;      // izquierda / derecha en el suelo
	float z = -pos.y;     // altura (‑ porque Y‑pantalla crece ↓)

	/* 3) Proyección isométrica                                      */
	vec2 iso;
	iso.x =  x * COS_ANGLE;
	iso.y =  x * SIN_ANGLE - z;

	/* 4) Escala global y vuelta al espacio local                    */
	iso *= iso_scale;
	VERTEX = iso + vec2(sprite_size.x * 0.5, sprite_size.y);
}

/* ------------------------------------------------------------------
   FRAGMENT – muestra la textura tal cual
   ------------------------------------------------------------------*/
void fragment () {
	COLOR = texture(TEXTURE, UV);
}
