#Downloads a lightweight Linux image with Python preinstalled.
From python:3.11-slim

#set your working directory (Inside the container, all files will live in /app)
WORKDIR /app 

#Copy Dependanices "Copies only the dependency file first."
#This helps Docker cache layers and makes future builds faster.
copy requirements.txt . 

#Installs Flask inside the image.
RUN pip install --no-cache-dir -r requirements.txt


#Copies all the project files.
COPY . .

#Expose port "Documents that the application listens on port 5000.""
EXPOSE 5000

#Start Application "Runs Flask when the container starts."
CMD ["python", "app.py"]