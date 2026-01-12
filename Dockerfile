# 使用官方 Python 完整镜像
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 复制源码到镜像里
COPY . /app

# 安装系统依赖（编译部分 Python 包用）
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*

# 安装 Python 依赖
RUN pip install --no-cache-dir --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# 设置默认命令，运行 ezBEQ
CMD ["python", "main.py"]
