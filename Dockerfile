FROM java:jre-alpine

RUN apk add --update --no-cache unzip wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-4.1.0.zip
RUN unzip stanford-corenlp-4.1.0.zip && rm stanford-corenlp-4.1.0.zip

WORKDIR stanford-corenlp-4.1.0

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV JAVA_MAX_MEM 1g
ENV PORT 9000
EXPOSE $PORT

CMD java -cp "*" -mx$JAVA_MAX_MEM edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000 -timeout 15000
