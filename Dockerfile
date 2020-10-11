FROM python:3.8.5
EXPOSE 8501
WORKDIR /app
COPY requirements-app.txt ./requirements-app.txt
RUN pip3 install -r requirements-app.txt
COPY . .
CMD streamlit run app.py $ARTIFACT_LOCATION --server.port $PORT

# streamlit-specific commands for config
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
RUN mkdir -p /root/.streamlit
RUN bash -c 'echo -e "\
[general]\n\
email = \"\"\n\
" > /root/.streamlit/credentials.toml'

RUN bash -c 'echo -e "\
[server]\n\
enableCORS = false\n\
" > /root/.streamlit/config.toml'