# 使用 Maven 官方镜像作为构建阶段
FROM maven:3.8.4-openjdk-17 AS build

# 设置工作目录
WORKDIR /app

# 将项目的 pom.xml 和 src 目录复制到工作目录
COPY pom.xml .
COPY src ./src

# 使用 Maven 编译项目
RUN mvn clean package -DskipTests

# 使用 OpenJDK 作为运行阶段
FROM openjdk:17-jdk-alpine

# 设置工作目录
WORKDIR /app

# 从构建阶段复制生成的 JAR 文件到运行阶段
COPY --from=build /app/target/puml-assistant-0.0.1-SNAPSHOT.jar app.jar

# 暴露应用运行的端口
EXPOSE 8080

# 运行 Spring Boot 应用
ENTRYPOINT ["java", "-jar", "app.jar"]
