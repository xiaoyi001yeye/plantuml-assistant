FROM node:20-alpine AS frontend-build
WORKDIR /app
COPY frontend .
ARG NPMRC_ENV=home
COPY frontend/.npmrc.${NPMRC_ENV} .npmrc
RUN set -x && npm install
RUN npm run build

FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
COPY settings.xml /app/settings.xml
COPY --from=frontend-build /app/dist ./src/main/resources/static
RUN mvn -s settings.xml clean package -DskipTests


FROM alpine:3.20

# 设置环境变量，用于国内加速
ENV LANG=C.UTF-8
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update
# 安装 Java 运行时环境，这里需要替换为可用的 JRE 17 包或者下载链接
RUN apk add --no-cache --update openjdk17-jre graphviz freetype wqy-zenhei && \
    rm -rf /var/cache/apk/*

# 设置 JAVA_HOME 环境变量
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH=$PATH:$JAVA_HOME/bin

# 设置工作目录
WORKDIR /app


# 从构建阶段复制生成的 JAR 文件到运行阶段
COPY --from=build /app/target/puml-assistant-0.0.1-SNAPSHOT.jar app.jar

# 暴露应用运行的端口
EXPOSE 8080

# 运行 Spring Boot 应用
ENTRYPOINT ["java", "-jar", "app.jar"]
