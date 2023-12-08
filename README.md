# 2023.2-PrintGo-Prisma


## Executando container

1. Instale dependencias do projeto 

```bash
    npm install
```

2. Para executar o container execute o comando: 

```bash
    docker-compose up --build -d
```

3. Container do banco rodando execute as migrações da base de dados:

```bash
    npm run migrate
```

