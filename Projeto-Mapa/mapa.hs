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

--trd que recebe uma tupla com três elementos de tipos genéricos x, y e z, e retorna o terceiro elemento z
trd :: (x, y, z) -> z
trd (_, _, z) = z

--função chamada addCidade que recebe dois argumentos: um Mapa (que é uma lista de cidades) e uma Cidade
addCidade :: Mapa -> Cidade -> Mapa
addCidade mapa cidade = cidade : mapa

--remove a cidade com o nome especificado do mapa. Se a cidade não for encontrada, o mapa permanece inalterado.
removerCidade :: Mapa -> Nome -> Mapa
removerCidade [] _ = []
removerCidade (cidade@(nome, _, _):resto) nomeParaRemover
    | nome == nomeParaRemover = resto
    | otherwise = cidade : removerCidade resto nomeParaRemover

main :: IO ()
main = do
    let meuMapaVazio = mapaVazio
    let aracaju = ("Aracaju", (10.0, 20.0), ["São Cristovão", "Maceió"])
    let saoCristovao = ("São Cristovão", (15.0, 25.0), ["Aracaju", "São Cristovão"])
    let maceio = ("Maceió", (12.0, 18.0), ["Aracaju", "São Cristovão"])
    let pauloAfonso = ("Paulo Afonso", (9.0, 38.0), [])  -- Adicionando Paulo Afonso

    -- Adicionando a cidade de Capela ao mapa
    let capela = ("Capela", (10.6, 36.2), ["Aracaju"])  -- Adicionei Capela com uma rota para Aracaju
    let meuMapaComCapela = addCidade [aracaju, saoCristovao, maceio, pauloAfonso] capela

    putStrLn "Mapa com a Cidade de Capela Adicionada:"
    mapM_ (exibirCidade) meuMapaComCapela

    -- Removendo a cidade de Capela do mapa (opcional)
    let meuMapaSemCapela = removerCidade meuMapaComCapela "Capela"

    putStrLn "Mapa sem a Cidade de Capela:"
    mapM_ (exibirCidade) meuMapaSemCapela

--função para exibir infomações iniciais (antes de gerar a imagem do mapa com as cidades.)
exibirCidade :: Cidade -> IO ()
exibirCidade (nome, (lat, long), rotas) = do
    putStrLn $ "Nome: " ++ nome
    putStrLn $ "Coordenadas: Latitude " ++ show lat ++ ", Longitude " ++ show long
    putStrLn $ "Rotas: " ++ unwords rotas
    putStrLn ""
