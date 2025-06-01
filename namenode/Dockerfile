# ─────────────────────────────────────────────────────────────────────────────
# Dockerfile do NameNode
#
# - Baseia em bde2020/hadoop-namenode:2.0.0-hadoop3.2.1-java8
# - Copia texto.txt (da raiz do projeto) para /tmp/texto.txt
# - Copia init-hdfs.sh para iniciar o Hadoop e aguardar o HDFS estar pronto
# - Copia os arquivos de configuração core-site.xml e hdfs-site.xml
# - Ajusta permissão de execução e define ENTRYPOINT
# - Expõe a porta 9870 (UI do NameNode)
# ─────────────────────────────────────────────────────────────────────────────

FROM bde2020/hadoop-namenode:2.0.0-hadoop3.2.1-java8

COPY texto.txt /tmp/texto.txt

COPY namenode/init-hdfs.sh /usr/local/bin/init-hdfs.sh
RUN chmod +x /usr/local/bin/init-hdfs.sh

COPY namenode/conf/core-site.xml  /etc/hadoop/core-site.xml
COPY namenode/conf/hdfs-site.xml  /etc/hadoop/hdfs-site.xml

ENTRYPOINT ["/usr/local/bin/init-hdfs.sh"]

EXPOSE 9870
