index
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Carregar os dados
url = "https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-cities.csv"
data = pd.read_csv(url)

# Visualizar os dados
print(data.head())

# Renomear as colunas para facilitar
columns = {
    "city": "Cidade",
    "state": "Estado",
    "totalCases": "TotalCasos",
    "deaths": "Mortes"
}
data.rename(columns=columns, inplace=True)

# 1. Cidade com mais casos de COVID
cidade_mais_casos = data.loc[data["TotalCasos"].idxmax()]
print("Cidade com mais casos de COVID:", cidade_mais_casos["Cidade"], cidade_mais_casos["TotalCasos"])

# 2. Cidade com menos casos de COVID
cidade_menos_casos = data[data["TotalCasos"] > 0].loc[data["TotalCasos"].idxmin()]
print("Cidade com menos casos de COVID:", cidade_menos_casos["Cidade"], cidade_menos_casos["TotalCasos"])

# 3. Estado com mais casos de COVID
estados_casos = data.groupby("Estado")["TotalCasos"].sum()
estado_mais_casos = estados_casos.idxmax()
print("Estado com mais casos de COVID:", estado_mais_casos, estados_casos[estado_mais_casos])

# 4. Estado com menos casos de COVID
estado_menos_casos = estados_casos.idxmin()
print("Estado com menos casos de COVID:", estado_menos_casos, estados_casos[estado_menos_casos])

# 5. Cidade com mais mortes por COVID
cidade_mais_mortes = data.loc[data["Mortes"].idxmax()]
print("Cidade com mais mortes por COVID:", cidade_mais_mortes["Cidade"], cidade_mais_mortes["Mortes"])

# 6. Cidade com menos mortes por COVID
cidade_menos_mortes = data[data["Mortes"] > 0].loc[data["Mortes"].idxmin()]
print("Cidade com menos mortes por COVID:", cidade_menos_mortes["Cidade"], cidade_menos_mortes["Mortes"])

# 7. Estado com mais mortes por COVID
estados_mortes = data.groupby("Estado")["Mortes"].sum()
estado_mais_mortes = estados_mortes.idxmax()
print("Estado com mais mortes por COVID:", estado_mais_mortes, estados_mortes[estado_mais_mortes])

# 8. Estado com menos mortes por COVID
estado_menos_mortes = estados_mortes.idxmin()
print("Estado com menos mortes por COVID:", estado_menos_mortes, estados_mortes[estado_menos_mortes])

# 9. Total de casos de COVID no Brasil
total_casos_brasil = data["TotalCasos"].sum()
print("Total de casos de COVID no Brasil:", total_casos_brasil)

# 10. Total de mortes por COVID no Brasil
total_mortes_brasil = data["Mortes"].sum()
print("Total de mortes por COVID no Brasil:", total_mortes_brasil)

# 11. Gráfico barplot: 5 estados com mais casos
top5_estados_casos = estados_casos.sort_values(ascending=False).head(5)
top5_estados_casos.plot(kind="bar", color="skyblue")
plt.title("Top 5 Estados com Mais Casos de COVID")
plt.xlabel("Estado")
plt.ylabel("Total de Casos")
plt.show()

# 12. Gráfico histograma: 5 estados com menos mortes
top5_estados_menos_mortes = estados_mortes.sort_values(ascending=True).head(5)
top5_estados_menos_mortes.plot(kind="bar", color="orange")
plt.title("Top 5 Estados com Menos Mortes de COVID")
plt.xlabel("Estado")
plt.ylabel("Total de Mortes")
plt.show()
