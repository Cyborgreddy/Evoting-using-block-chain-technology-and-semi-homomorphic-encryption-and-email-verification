# eVoting System with Blockchain and Semi-Homomorphic Encryption

## Overview

This project is an electronic voting (eVoting) system developed using Java and Tomcat. It leverages blockchain technology for secure and transparent record-keeping of votes and incorporates semi-homomorphic encryption for ensuring the privacy and integrity of individual votes. Additionally, email verification is implemented to authenticate voters and enhance security.

## Features

- **Blockchain Technology**: Utilizes blockchain for maintaining an immutable ledger of votes, ensuring transparency and tamper-resistance.
- **Semi-Homomorphic Encryption**: Implements semi-homomorphic encryption to secure the confidentiality and integrity of votes while allowing for efficient tallying.
- **Email Verification**: Ensures the authenticity of voters through email verification, enhancing the security and credibility of the eVoting system.
- **Java & Tomcat**: Developed using Java programming language and deployed on Apache Tomcat server for robustness and scalability.
- **Web Interface**: Provides a user-friendly web interface for voters to cast their votes securely and conveniently.
- **Administrative Dashboard**: Includes an administrative dashboard for monitoring voting activities, managing users, and generating reports.

## Setup Instructions

### Prerequisites

- Java Development Kit (JDK)
- Apache Tomcat Server (6.0)
- MySQL Database

### Installation Steps

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/evoting-project.git
   ```

2. Set up the MySQL database by executing the SQL scripts provided in the `database` folder.

3. Configure the database connection in `src/main/resources/application.properties`.

4. Build the project using Maven:

   ```bash
   mvn clean install
   ```

5. Deploy the WAR file generated in the `target` directory to your Tomcat server.

6. Access the application through the provided URL and start using the eVoting system.

## Usage

1. **Voter Registration**: Voters need to register using their email addresses. An email verification link will be sent to verify their identity.

2. **Voting Process**: Once verified, voters can log in and cast their votes securely through the web interface.

3. **Vote Tallying**: The votes are encrypted and stored on the blockchain. Semi-homomorphic encryption allows for secure vote tallying without compromising individual vote privacy.

4. **Administrative Tasks**: Admins can monitor voting activities, manage users, and generate reports through the administrative dashboard.

## Contributing

Contributions are welcome! If you would like to contribute to this project, please fork the repository, make your changes, and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

