# 使用官方 Python 镜像
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 复制源码
COPY . /app

# 安装系统依赖（编译 numpy, scipy, soundfile 等库需要）
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        python3-dev \
        libsndfile1 \
        ffmpeg \
        git \
        wget && \
    rm -rf /var/lib/apt/lists/*

# 升级 pip 并安装 Python 依赖
RUN pip install --no-cache-dir --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# 默认命令，启动 ezBEQ
CMD ["python", "main.py"]
