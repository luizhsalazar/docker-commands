# docker-commands

### startar container que está rodando mas em estado stop

$ docker start a64 -a -it

### remover todos containers

$ docker container prune

### sobe container sem segurar o terminal

### docker run procura a imagem e, se não encontrar, faz pull da imagem do dockerhub

$ docker run -d dockersamples/static-site

### subir o container e prender o terminal no container

$ docker run -it dockersamples/static-site

### para o container em tempo zero (default é aguardar 10 segundos para matar o container)

$ docker stop -t 0 <ID_CONTAINER>

### para todos os containers que estão rodando ao mesmo tempo

$ docker stop -t 0 $(docker ps -q)

### retorna os ids dos containers

$ docker ps -q

### verificar qual porta do container está sendo mapeada para a porta do host

$ docker port <ID_CONTAINER>

### o “-P” cria mapeamento de portas aleatórias para fora do container

$ docker run -d -P dockersamples/static-site

### o “-p” mapeia a porta 12345 para a porta 80 - ao invés de ser aleatório

$ docker run -d -p 123456:80 dockersamples/static-site

### atrelar um nome ao container - ao invés de usar o id pra interagir com o container

### posso usar o nome

$ docker run -d -P --name meu-site dockersamples/static-site

### o “-e” seta a variável de ambiente dentro do container

$ docker run -d -P --name meu-site -e AUTHOR=”João da Silva” dockersamples/static-site

### printa informações sobre o container (volumes, configs, etc)

$ docker inspect <ID_CONTAINER>

### cria um volume no meu home mapeado para a pasta “/var/www” dentro do container

### a pasta fica espelhada no docker host (engine do docker)

$ docker run -it -v “\home\salazar:\var\www” ubuntu

\*\* Volumes salvos não ficam no container e sim no Docker Host

Executando um container com node e código na máquina local

### considera-se que tem um app node na pasta “/home/projects/node-app” e é executado

### o comando “npm start” ao iniciar o container

### o “-w” é o WORKDIR (work directory) do container, ou seja, a pasta em que o container

### deve iniciar e rodar o meu comando “npm start”.

### caso não seja passado o WORKDIR o container inicia numa pasta default

### e pode não conter o comando que desejo executar

$ docker run -d -p 8080:3000 -v “/home/projects/node-app:/var/www” -w /var/www” node npm start

### otimizando e usando o diretório atual para mapear com a pasta do container

$ docker run -d -p 8080:3000 -v “$(pwd):/var/www” -w /var/www” node npm start

_____________________________________________________

### Build de imagem através de Dockerfile

### gera a imagem através do Dockerfile com a tag "salazar:node-image" utilizando o "contexto" da pasta atual "."
$ docker build -f Dockerfile -t salazar:node-image . 
