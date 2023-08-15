FROM mariadb/columnstore

# Set environment variables
ENV PM1=mcs

# Copy your SQL script and CSV file into the container
COPY script.sql /tmp/
COPY entries.csv /tmp/

# Run the provision command within the container
