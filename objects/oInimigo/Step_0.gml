/// Evento Step do oInimigo

// Define a velocidade do inimigo (lenta)
speed = 0.5; // Velocidade de movimento

// Verifica se o inimigo está sobre o piso (oPiso)
if (!place_meeting(x, y + 1, oPiso)) {
    // Se não estiver sobre o piso, inverte a direção
    direction = 180 - direction; // Inverte a direção horizontal
}

// Verifica colisão com spikes (oSpike) ou moedas (oMoeda)
var colisao = place_meeting(x + lengthdir_x(speed, direction), y, oSpike) ||
              place_meeting(x + lengthdir_x(speed, direction), y, oMoeda);

// Se houver colisão, inverte a direção
if (colisao) {
    direction = 180 - direction; // Inverte a direção horizontal
}

// Verifica a direção do movimento para virar o sprite
if (hspeed > 0) { // Movendo para a direita
    image_xscale = 1; // Sprite na orientação original
} else if (hspeed < 0) { // Movendo para a esquerda
    image_xscale = -1; // Inverte o sprite horizontalmente
}

// Evento Collision com oPlayer (jogador)
if (place_meeting(x, y, oPlayer)) {
    with (oPlayer) {
        instance_destroy(); // Mata o jogador ao encostar no inimigo
    }
}
