#!/usr/bin/env bash
set -e

/run.sh &

HADOOP_PID=$!

sleep 15

echo ">>> Verificando disponibilidade do HDFS..."
n=0
until hdfs dfs -ls / > /dev/null 2>&1; do
  n=$((n+1))
  if [ $n -ge 10 ]; then
    echo "HDFS não atingiu estado pronto após várias tentativas. Abortando."
    kill $HADOOP_PID 2>/dev/null || true
    exit 1
  fi
  echo "HDFS ainda não está pronto (tentativa $n), aguardando 5s..."
  sleep 5
done

echo ">>> HDFS pronto! Criando diretório /user/root/input e copiando texto.txt..."

hdfs dfs -mkdir -p /user/root/input

hdfs dfs -put -f /tmp/texto.txt /user/root/input/

echo ">>> Copiado /tmp/texto.txt para /user/root/input/texto.txt no HDFS."

wait $HADOOP_PID
