Pedestres e Carros são valores de 4 bits.

Semáfaro A:
SW0 ... SW3   - Número de Carros.
SW4 ... SW7   - Número de Pedestres.
LD17        - Semáforo de veículos.
LD0 e LD1   - Semáforo de pedestres.

Semáfaro B:
SW8 ... SW11   - Número de Carros.
SW12 ... SW15   - Número de Pedestres.
LD16        - Semáforo de veículos.
LD2 e LD3   - Semáforo de pedestres.

Máquina de estados:
S0: Sem0 = Verde,       Sem1 = Vermelho.    T - Varia de acordo com as variáveis
S1: Sem0 = Amarelo,     Sem1 = Vermelho.    T - Constante
S2: Sem0 = Vermelho,    Sem1 = Verde.       T - Varia de acordo com as variáveis
S3: Sem0 = Vermelho,    Sem1 = Amarelo.     T - Constante