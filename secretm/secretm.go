package secretm

import (
	"encoding/json"
	"fmt"
	"github.com/JrGustavo/petal0/awsgo"
	"github.com/JrGustavo/petal0/models"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/service/secretsmanager"
)

func GetSecret(nombreSecret string) (models.SecretRDSJson, error) {
	var datosSecret models.SecretRDSJson
	fmt.Println(" > Pido Secreto" + nombreSecret)

	svc := secretsmanager.NewFromConfig(awsgo.Cfg)
	clave, err := svc.GetSecretValue(awsgo.Ctx, &secretsmanager.GetSecretValueInput{
		SecretId: aws.String(nombreSecret),
	})

	if err != nil {
		fmt.Println("Error al obtener el secreto" + err.Error())
		return datosSecret, err
	}

	json.Unmarshal([]byte(*clave.SecretString), &datosSecret)
	fmt.Println(" > Secreto obtenido " + datosSecret.Username)
	return datosSecret, nil
}
