shader_type canvas_item;

/* ------------------------------------------------------------------
   CONFIGURACIÓN
   ------------------------------------------------------------------*/

/* Escala global del resultado isométrico.
   Sube o baja este valor hasta que el bloque encaje en tu escena.   */
uniform float iso_scale : hint_range(0.1, 4.0) = 1.0;

/* Medidas originales del sprite en píxeles.
   Pon aquí texture.get_size() para que el centrado sea perfecto.    */
uniform vec2 sprite_size = vec2(128.0, 32.0);

/* ------------------------------------------------------------------
   CONSTANTES DE PROYECCIÓN ISOMÉTRICA
   Proyección dimétrica clásica: 30 ° respecto al eje horizontal.
   (cos 30 ° = 0.8660254,  sin 30 ° = 0.5)                          */
const float COS_ANGLE = 0.8660254;
const float SIN_ANGLE = 0.5;

/* ------------------------------------------------------------------
   VÉRTEX: se transforma la posición de cada vértice del quad.
   ------------------------------------------------------------------*/
void vertex() {
    /* 1. Centramos el sprite en el origen para que la proyección
          salga simétrica.                                           */
    vec2 pos = VERTEX - sprite_size * 0.5;

    /* 2. Proyectamos de cartesiano (x, y) a isométrico (isoX, isoY). */
    vec2 iso;
    iso.x = (pos.x - pos.y) * COS_ANGLE;
    iso.y = (pos.x + pos.y) * SIN_ANGLE;

    /* 3. Aplicamos la escala global y devolvemos al espacio local.  */
    iso *= iso_scale;
    VERTEX = iso + sprite_size * 0.5;
}

/* ------------------------------------------------------------------
   FRAGMENT: muestras el texel tal cual (sin cambios en UV).
   ------------------------------------------------------------------*/
void fragment() {
    COLOR = texture(TEXTURE, UV);
}
