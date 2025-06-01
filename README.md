# Hadoop HDFS + MapReduce

Este projeto demonstra como executar o clássico exemplo WordCount utilizando um cluster Hadoop 3.2.1 empacotado em containers Docker. A configuração inclui um NameNode e um DataNode em containers separados, permitindo testar MapReduce localmente sem precisar instalar Hadoop diretamente na máquina.

---

## 📚 Índice

1. [Pré-requisitos](#1--pré-requisitos)
2. [Subindo o Cluster Hadoop](#2--subindo-o-cluster-hadoop)  
3. [Executando o Exemplo WordCount](#3--executando-o-exemplo-wordcount)  
4. [Encerrar o Cluster Hadoop](#4--encerrar-o-cluster-hadoop)

---

## 1. ✅ Pré-requisitos

Antes de começar, certifique-se de ter instalado em sua máquina:

- **Docker** (versão 20.x ou superior recomendada)  
- **Docker Compose** (versão 1.29.x ou superior recomendada)  

> Caso ainda não tenha instalado, consulte a documentação oficial:  
> - [Instalar Docker](https://docs.docker.com/get-docker/)  
> - [Instalar Docker Compose](https://docs.docker.com/compose/install/)  

---

## 2. 🚀 Subindo o Cluster Hadoop

Fazer o build das imagems:
```bash
docker-compose build
```

Para iniciar o cluster Hadoop:
```bash
docker-compose up -d
```

Verifique se os containers estão em execução:
```bash
docker ps
```

---

## 3. 📝 Executando o Exemplo WordCount

Acesse o bash do serviço NameNode:
```bash
docker-compose exec namenode bash
```

Execute o WordCount:
```bash
hadoop jar /opt/hadoop-3.2.1/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar \
  wordcount \
  /user/root/input/texto.txt \
  /user/root/output-wordcount
```
Visualize o resultado:
```bash
hdfs dfs -ls /user/root/output-wordcount
hdfs dfs -cat /user/root/output-wordcount/part-r-00000
```
> Exemplo de entrada (texto.txt):
> ```txt
> exemplo texto wordcount palavra hadoop
> ```
> Exemplo de saída:
> ```bash
> exemplo  1
> hadoop   2
> palavra  5
> texto    3
> wordcount 1
> ```

Apague o resultado atual para executar o WordCount outras vezes:
```bash
hdfs dfs -rm -r /user/root/output-wordcount
```

---

## 4. ⛔ Encerrar o Cluster Hadoop

Para remover os containers:
```bash
docker compose down
```

## 📎 Observações

- As portas padrão do Hadoop podem ser acessadas no navegador:

    - NameNode UI: http://localhost:9870

    - ResourceManager UI: http://localhost:8088

- Este projeto é útil para fins educacionais, testes de MapReduce e aprendizagem do ecossistema Hadoop em um ambiente controlado e leve.