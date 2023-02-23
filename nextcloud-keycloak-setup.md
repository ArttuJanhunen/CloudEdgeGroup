# Setup Nextcloud to use Keycloak authorization

**NB! Currently no HTTPS**
Base on the medium article [here](https://medium.com/@laurent.roffe_24715/keycloak-integrated-with-nextcloud-in-a-kubernetes-cluster-f6d5c5f25fb0)

## Nextcloud step 1

1. Spin up the cluster
2. Go to http://localhost
3. Login with Nextcloud Admin user and password (admin/Possu123!)
4. Press the Admin account on nextcloud top right
5. Select "Apps"
6. Click the Search icon on the top right
7. Type Social and select "Social login"
8. App should be by zorn-v AGPL-licensed, install the app

## Keycloak

1. Login to Keycloak crom http://localhost/keycloak (admin/admin)
2. In the top left dropdown, click it -> Create Realm
3. Realm name -> nextcloud, Enabled -> true
4. Left nav bar -> Realm settings -> Themes tab

- Login theme -> keycloak
- Account theme -> keycloak.v2
- Admin UI theme -> keycloak.v2
- Save

5. Left nav bar -> Click Clients
6. Click the "Create client" blue button

- Client type -> OpenID Connect
- Client ID -> nextcloud-client
- Name -> Nextcloud client
- Next
- Client authentication -> ON
- Authorization -> ON
- Next
- Home URL -> http://localhost/keycloak/realms/nextcloud/account/
- Valid redirect URIs -> http://localhost/apps/sociallogin/custom_oidc/Keycloak

7. Left navbar, press "Users"

- Add user
- Username -> <choose username>
- Email -> <choose email>
- Email verified -> TRUE
- First name -> <choose firstName>
- Last name -> <choose lastName>
- Create
- Press "Credentials" tab
- Click "Set password"
- Generate a password, temporary -> OFF -> SAVE -> SAVE PASSWORD

8. Left navbar "Clients"

- Select "nextcloud-client"
- Open Credentials TAB
- Copy the Client SECRET (it's a trap)

## Nextcloud part 2

- Login localhost -> admin/Possu123!
- Top right icon -> Administration Settings
- Left nav bar under "administration" -> Social Login
- "Custom OpenID Connect" press +
  - Internal name -> Keycloak
  - Title -> keycloak
  - Authorize URL -> http://localhost/keycloak/realms/nextcloud/protocol/openid-connect/auth
  - Token URL -> http://mess-keycloak-service:8080/keycloak/realms/nextcloud/protocol/openid-connect/token
  - Client Id -> nextcloud-client
  - Client Secret -> Paste the value or return to step 8 of Keycloak ;)
  - Scope -> openid
  - Button style -> Keycloak
  - Scroll down ALL the way and press SAVE
