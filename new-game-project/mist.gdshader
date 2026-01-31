shader_type canvas_item;

uniform sampler2D noise_texture : repeat_enable;
uniform sampler2D noise_texture2 : repeat_enable;
uniform vec4 cloud_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float speed : hint_range(0.0, 0.1) = 0.01;
uniform float density : hint_range(0.0, 1.0) = 0.5;

void fragment() {
    vec2 uv_speed = UV + vec2(TIME * speed, TIME * speed * 0.5);
    vec2 uv_speed2 = UV + vec2(TIME * -speed * 0.8, TIME * speed * 0.2);
    
    float noise1 = texture(noise_texture, uv_speed).r;
    float noise2 = texture(noise_texture2, uv_speed2).r;
    
    float clouds = (noise1 + noise2) * 0.5;
    
    clouds = smoothstep(1.0 - density, 1.0, clouds);
    
    COLOR = vec4(cloud_color.rgb, clouds * cloud_color.a);
}
