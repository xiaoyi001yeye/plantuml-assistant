# PUML Assistant

PUML Assistant 是一个基于 Spring Boot 的项目，用于生成 PUML 图。

## 项目结构

## 安装

### 先决条件

- [JDK 17](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html)
- [Maven](https://maven.apache.org/install.html)
- [Docker](https://www.docker.com/get-started)

### 克隆项目
```
sh
git clone https://github.com/yourusername/puml-assistant.git
cd puml-assistant
```

### 使用 Maven 构建项目
```sh
./mvnw clean package
```

## 运行

### 使用 Maven 运行
```sh
./mvnw spring-boot:run
```

访问 `http://localhost:8080` 查看应用。

### 使用 Docker 运行

#### 构建 Docker 镜像
```
docker build -t puml-assistant .
```

#### 运行 Docker 容器
```
docker run -p 8080:8080 puml-assistant
```


访问 `http://localhost:8080` 查看应用。

## 使用

访问 `http://localhost:8080`，你将看到一个表单，可以输入你的 PUML 图示例。提交表单后，应用将生成并显示 PUML 图。

## 支持特性

- [x] 输入 PUML 语法并生成图像 0.0.1


## 待办特性清单

- [ ] 预览图片支持最大化显示
- [ ] 预览图片支持下载
- [ ] 提供多语言支持
- [ ] 支持不同操作系统的安装、运行
- [ ] 根据不同UML类型提供示例

## 贡献

欢迎贡献！请 fork 这个仓库并提交 PR。   
[贡献指南](CONTRIBUTING.MD)。

## 许可证

这个项目使用 [许可证](LICENSE)。


说明
项目结构: 展示了项目的目录结构。
安装: 包含了先决条件和安装步骤。
运行: 提供了使用 Maven 和 Docker 运行项目的说明。
使用: 简要说明了如何使用该应用。
贡献: 鼓励其他人贡献代码。
许可证: 提供了许可证信息。
