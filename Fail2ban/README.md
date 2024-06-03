# Procedimento de configuração do Fail2ban
## Soluções utilizadas para o laboratório

- Vagrant (versão: 2.2.19)
- Virtualbox (versão: 6.1)

## Configurações necessárias antes de criar a máquina virtual via Vagrant

Antes de criar a máquina virtual, as etapas abaixo serão necessárias:

- Ajustar o arquivo do ***Vagrantfile*** com o endereço de rede de sua preferência (endereço da sua rede local);
- Ajustar as configurações de recursos do servidor virtual (processador e memória) caso necessário;
- Criar as chaves SSH para que o acesso ao servidor virtual seja  possível, usando o usuário ***"vagrant"***;

### Criando chaves SSH
Caso você não tenha uma chave SSH configurada para o seu usuário do sistema Linux, utilize o comando abaixo para gerar as chaves:

> ssh-keygen -t rsa -b 4096

***Obs.: Mantenha o padrão durante a configuração da chave SSH, sem necessidade de adição de senha para a chave. Lembrando também de executar o comando utilizando o usuário do sistema que será usado para a configuração do ambiente.***

## Criando a máquina virtual

Uma vez que todas as configurações estiverem ajustadas, execute o comando abaixo para iniciar o processo de configuração do ambiente:

> vagrant up

## Acessando a máquina virtual

Com a máquina virtual devidamente configurada, basta utilizar o comando abaixo para acessar o sistema operacional (caso necessário):

> ssh vagrant@<ENDEREÇO_IP_MÁQUINA_VIRTUAL>

***Exemplo:*** ssh vagrant@192.168.0.100
