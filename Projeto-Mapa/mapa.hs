--Projeto Programação Funcional

-- NOME: vai representar as cidade
--COORDENADAS:é uma tupla para representar as coordenadas geometricas
--ROTAS: lista de NOMES(cidades) para determinar possiveis rotas
--CIDADE:uma tupla para representar as cidades conectadas.
--MAPA:lista de cidades que compoeem o mapa
type Nome = String
type Coordenadas = (Double, Double)
type Rotas = [Nome]
type Cidade = (Nome, Coordenadas, Rotas)
type Mapa = [Cidade]

--função que retorna uma lista vazia que é chamada de mapa.
mapaVazio :: Mapa
mapaVazio = []

main :: IO ()
main = do
    let meuMapaVazio = mapaVazio
    let aracaju = ("Aracaju", (10.0, 20.0), ["São Cristovão", "Maceió"])
    let saoCristovao = ("São Cristovão", (15.0, 25.0), ["Aracaju", "São Cristovão"])
    let maceio = ("Maceió", (12.0, 18.0), ["Aracaju", "São Cristovão"])
    let pauloAfonso = ("Paulo Afonso", (9.0, 38.0), [])  -- Adicionando Paulo Afonso
    let meuMapa = [aracaju, saoCristovao, maceio, pauloAfonso]  -- Adicionando a cidade ao mapa

    putStrLn "Mapa:"
    mapM_ (exibirCidade) meuMapa


--função para exibir infomações iniciais (antes de gerar a imagem do mapa com as cidades.)
exibirCidade :: Cidade -> IO ()
exibirCidade (nome, (lat, long), rotas) = do
    putStrLn $ "Nome: " ++ nome
    putStrLn $ "Coordenadas: Latitude " ++ show lat ++ ", Longitude " ++ show long
    putStrLn $ "Rotas: " ++ unwords rotas
    putStrLn ""
