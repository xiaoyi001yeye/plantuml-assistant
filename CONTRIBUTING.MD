# 贡献指南

感谢你对 PUML Assistant 的兴趣！我们欢迎所有形式的贡献。

## 如何贡献

### 报告问题

1. 访问项目的 [Issues](https://github.com/yourusername/puml-assistant/issues) 页面。
2. 点击 `New issue` 按钮。
3. 填写问题的标题和描述，并提交。

### 提交新功能或改进

1. 访问项目的 [Issues](https://github.com/yourusername/puml-assistant/issues) 页面。
2. 点击 `New issue` 按钮。
3. 填写新功能或改进的标题和描述，并提交。
4. 创建一个新的分支：
    ```sh
    git checkout -b feature/your-feature-name
    ```
5. 提交你的更改：
    ```sh
    git commit -am 'Add some feature'
    git push origin feature/your-feature-name
    ```
6. 创建一个 Pull Request。

### 待办特性清单

- [ ] 预览图片支持最大化显示
- [ ] 预览图片支持下载
- [ ] 提供多语言支持
- [ ] 支持不同操作系统的安装、运行
- [ ] 根据不同UML类型提供示例

## 开发指南

### 本地开发

1. 克隆项目：
    ```sh
    git clone https://github.com/yourusername/puml-assistant.git
    cd puml-assistant
    ```
2. 使用 Maven 构建项目：
    ```sh
    ./mvnw clean package
    ```
3. 运行项目：
    ```sh
    ./mvnw spring-boot:run
    ```

### 代码风格

请遵循项目的代码风格指南，确保代码的一致性和可读性。
