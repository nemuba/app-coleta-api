# Collect API

## Endpoints

* Criar conta
  
```json
// POST api/v1/users/sign_up
{
  "email": "email@eamial.com",
  "password": "123456789",
  "password_confirmation": "123456789",
  "role": 0
}
// retorna token jwt no header: headers['access-token']
// enum role: {admin: 0, customer: 1, business: 2, collector: 3}
```

* Fazer Login

```json
// POST api/v1/users/sign_in
{
  "email": "email@eamial.com",
  "password": "123456789",
}
// retorna token jwt no header: headers['access-token']
```

* Cadastrar Profile
  
```json
{
  "profile": {
    "name": "admin",
    "phone": "12997245805",
    "email": "admin@contact.com",
    "document": "43595959599",
    "address_attributes":{
      "id": 1,
      "street": "Rua tal",
      "number": "45",
      "neighborhood": "Bairro",
      "city": "Cidade",
      "country": "Pais",
      "zip_code": "Código Postal",
      "latitude": "12.2245",
      "longitude": "-9.52585",
      "_destroy": 1
    }
  }
}
// _destroy: 1 e id: 1,
// id para referência e _destroy para informar a exclusão;
```

* Cadastrar Produto

```json
// POST /api/v1/collect/products
{
  "product":{
    "name": "Product #1",
    "price": 250,
    "point": 10
  }
}
```
