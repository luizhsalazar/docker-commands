# usa imagem do node
FROM node:latest

# copia o código da pasta atual para a pasta
# "/var/www" do container
COPY . /var/www

# seta a pasta "inicial" do container para "/var/www"
WORKDIR /var/www

# executa o comando para instalar as dependências
RUN npm install

# quando rodar o "docker run" dessa imagem, executar o
# comando "npm start" para subir a aplicação
ENTRYPOINT [ "npm", "start" ]

# expõe a porta 3000 para "fora" do container pois
# é nela que a aplicação do container está rodando
EXPOSE 3000