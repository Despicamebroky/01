// Aplicando gravidade
vspeed += gravidade;

// Limitando a velocidade de queda
if (vspeed > velocidade_max) {
    vspeed = velocidade_max;
}

// Movimento horizontal
if (keyboard_check(vk_left)) {
    x -= velocidade image_xscale=-1; // Move para a esquerda
}
if (keyboard_check(vk_right)) {
    x += velocidade image_xscale=1; // Move para a direita
}

// Impedir que o jogador passe pelo piso
if (place_meeting(x, y + vspeed, oPiso)) {
    while (!place_meeting(x, y + sign(vspeed), oPiso)) {
        y += sign(vspeed); // Ajusta a posição até encostar no chão
    }
    vspeed = 0; // Para a queda ao tocar o chão
}

// Pular
if (keyboard_check_pressed(vk_up) && place_meeting(x, y + 1, oPiso)) {
    vspeed = forca_pulo;
}

// Segurar o pulo no ar
if (keyboard_check(vk_up) && vspeed < 0) {
    vspeed -= 0.3; // Ajuste este valor para aumentar o tempo do pulo
}

// Aplicando o movimento vertical
y += vspeed;



// Se o player cair abaixo de um certo ponto (exemplo: y > 500), ele "morre"
if (y > 500) {
    instance_destroy(); // Remove o jogador
    room_restart(); // Reinicia a sala
}


// Ajusta a câmera para seguir o jogador suavemente
var camX = lerp(camera_get_view_x(view_camera[0]), x - 100, 0.1);
var camY = lerp(camera_get_view_y(view_camera[0]), y - 50, 0.1);
camera_set_view_pos(view_camera[0], camX, camY);



// Definir sprite de andar

if keyboard_check(vk_anykey){
	sprite_index=sPlayerAnda
}
else{
	sprite_index=sPlayer
}
