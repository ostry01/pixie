# Pixie

Strona z obrazkami.

## Jak rozwijać projekt?

### Instalacja na jednostce roboczej.

Instalowanie potrzebnych gemów.

```
bundle --without production
```
Tworzenie tabel w bazie danych.

```
foreman run rake db:migrate
```
Stworzenie nowego administratora.

```
foreman run rake db:add_admin
```
