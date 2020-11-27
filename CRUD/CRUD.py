import psycopg2

class Pessoa():
    cur = 0
    def __init__(self, cur):
        self.cur = cur
    
    def createPessoa(self, cpf, name, phone, email):
        commandString = "INSERT INTO pessoa(cpf,nome,telefone,email) VALUES ('%s', '%s', '%s', '%s');"
        try:
            cur.execute(commandString % (cpf, name, phone, email))
        except:
            return("CPF ja cadastrado!")

    def readPessoa(self, cpf):
        commandString =  "SELECT * FROM pessoa WHERE cpf = '%s';"
        try:
            cur.execute(commandString % (cpf))
            query = cur.fetchall()
            # print("IdPessoa: ", query[0][0])
            # print("CPF: ", query[0][1])
            # print("Nome: ", query[0][2])
            # print("Telefone: ", query[0][3])
            # print("Email: ", query[0][4])
            return(query)
        except:
            return("CPF nao encontrado!")
    
    def updatePessoa(self, cpf, newName, newPhone, newEmail):
        commandString = "UPDATE pessoa SET nome = '%s', telefone = '%s', email = '%s' WHERE cpf = '%s';"
        try:
            cur.execute(commandString % (newName, newPhone, newEmail, cpf))
        except:
            return("CPF não encontrado para a atualização!")
    
    def deletePessoa(self, cpf):
        commandString = "DELETE FROM pessoa WHERE cpf = '%s';"
        try:
            cur.execute(commandString % cpf)
            return("Usuario deletado com sucesso!")
        except:
            return("CPF nao encontrado!")

class GrupoMusical():
    cur = 0
    def __init__(self, cur):
        self.cur = cur
    
    def createGrupoMusical(self, name, biography, origin):
        commandString = "INSERT INTO grupomusical(nome,biografia,origem) VALUES ('%s', '%s', '%s');"
        try:
            cur.execute(commandString % (name, biography, origin))
            return("Grupo Musical cadastrado com sucesso!")
        except:
            return("Erro ao cadastrar grupo musical")

    def readGrupoMusical(self, name):
        commandString = "SELECT * FROM grupomusical WHERE nome = '%s' LIMIT 1;"
        try:
            cur.execute(commandString % name)
            query = cur.fetchall()
            # print("ID Grupo Musical: ", query[0][0])
            # print("Nome: ", query[0][1])
            # print("Biography: ", query[0][2])
            # print("Origem: ", query[0][3])
            return(query)
        except:
            return("Grupo musical não encontrado")
    
    def readGrupoMusicalOrigem(self, origin):
        commandString = "SELECT * FROM grupomusical WHERE origem = '%s';"
        try:
            cur.execute(commandString % origin)
            query = cur.fetchall()
            return(query)
        except:
            return("Grupo musical não encontrado")

    def updateGrupoMusical(self, name, newName, biography, origin):
        commandString = "UPDATE grupomusical SET nome = '%s' biografia = '%s', origem = '%s' WHERE nome = '%s';"
        try:
            cur.execute(commandString % (newName, biography, origin, name))
        except:
            return("Grupo Musical não encontrado")
    
    def deleteGrupoMusical(self, name):
        commandString = "DELETE FROM grupomusical WHERE nome = '%s';"
        try:
            cur.execute(commandString % name)
            return("Grupo Musical deletado com sucesso!")
        except:
            return("Grupo Musical não encontrado!")

class Playlist():
    cur = 0
    def __init__(self, cur):
        self.cur = cur
    
    def createPlaylist(self, name, description, startTime):
        commandString = "INSERT INTO playlist(nome,descricao,horainicio) VALUES ('%s', '%s', '%s');"
        try:
            cur.execute(commandString % (name, description, startTime))
            return("Playlist Criada com Sucesso")
        except:
            return("Erro na criacao da Playlist")
            pass
    def readPlaylist(self, name):
        commandString = "SELECT * FROM playlist WHERE nome = '%s' LIMIT 1;"
        try:
            cur.execute(commandString % (name))
            query = cur.fetchall()
            # print("Playlist encontrada!")
            # print("IdPlaylist: ", query[0][0])
            # print("nome: ", query[0][1])
            # print("Descricao: ", query[0][2])
            # print("Hora Inicio: ", query[0][3])
            return(query)
        except:
            return("Playlist Nao encontrada")

    def readPlaylistHoraInicio(self, startTime):
        commandString = "SELECT * FROM playlist WHERE horainicio = '%s' LIMIT 1;"
        try:
            cur.execute(commandString % (startTime))
            query = cur.fetchall()
            return(query)
        except:
            return("Playlist nao econtrada")
    
    def updatePlaylist(self, where, newName, newBio, newStarTime):
        commandString = "UPDATE playlist SET nome = '%s', descricao = '%s', horainicio = '%s' WHERE nome = '%s';"
        try:
            cur.execute(commandString % (newName, newBio, newStarTime, where))
            return("Playlist atualizada com sucesso")
        except:
            return("Playlist nao encontrada")
    
    def deletePlaylist(self, name):
        commandString = "DELETE FROM playlist WHERE nome = '%s';"
        try:
            cur.execute(commandString % (name))
            return("Playlist deletada com sucesso")
        except:
            return("Playlist nao encontrada")

class Musica():
    cur = 0
    def __init__(self, cur):
        self.cur = cur
    
    def createMusica(self, name, year, durationSec, plays, genre, nameGrupoMusical):
        commandString = "INSERT INTO musica(nome,ano,duracaosegundos,plays,genero,fk_grupomusical_idgrupomusical) VALUES ('%s', '%s', '%s', '%s', '%s', '%s');"
        commandStringGrupoMusical = "SELECT * FROM grupomusical WHERE nome = '%s' LIMIT 1;"
        try:
            cur.execute(commandStringGrupoMusical % nameGrupoMusical)
            query = cur.fetchall()
            idGrupoMusical = query[0][0]
            try:
                cur.execute(commandString % (name, year, durationSec, plays, genre, idGrupoMusical))
                return("Musica adicionada com Sucesso!")
            except:
                return("Erro ao adicionar Musica")
        except:
            return("Grupo musical nao encontrado")

    def readMusica(self, name):
        commandString = "SELECT * FROM musica WHERE nome = '%s' LIMIT 1;"
        try:
            cur.execute(commandString % (name))
            query = cur.fetchall()
            # print("idMusica: ", query[0][0])
            # print("nomeMusica: ", query[0][1])
            # print("anoMusica: ", query[0][2])
            # print("duracaoMusica: ", query[0][3])
            # print("numero de Plays: ", query[0][4])
            # print("genero Musical: ", query[0][5])
            # print("idGrupoMusical: ", query[0][6])
            return(query)
        except:
            return("Musica nao encontrada")
    
    def readMusicaGenero(self, genre):
        commandString = "SELECT * FROM musica WHERE genero = '%s';"
        try:
            cur.execute(commandString % (genre))
            query = cur.fetchall()
            return(query)
        except:
            return("Musica nao encontrada")

    def readMusicaGrupoMusical(self, nameGrupoMusical):
        commandString = "SELECT * FROM musica WHERE fk_grupomusical_idgrupomusical = '%s';"
        commandStringGrupoMusical = "SELECT * FROM grupomusical WHERE nome = '%s' LIMIT 1;"
        try:
            cur.execute(commandStringGrupoMusical % nameGrupoMusical)
            query = cur.fetchall()
            idGrupoMusical = query[0][0]
            try:
                cur.execute(commandString % (idGrupoMusical))
                query = cur.fetchall()
                return(query)
            except:
                return("Musica nao encontrada")
        except:
            return("Grupo Musical nao encontrado")


    def updateMusica(self, where, newName, newYear, newDurationSec, newPlays, newGenre, nameGrupoMusical):
        commandString = "UPDATE musica SET nome = '%s', ano = '%s', duracaosegundos = '%s', plays = '%s', genero = '%s', fk_grupomusical_idgrupomusical = '%s' WHERE nome = '%s';"
        commandStringGrupoMusical = "SELECT * FROM grupomusical WHERE nome = '%s' LIMIT 1;"
        try:
            cur.execute(commandStringGrupoMusical % nameGrupoMusical)
            query = cur.fetchall()
            idGrupoMusical = query[0][0]
            try:
                cur.execute(commandString % (newName, newYear, newDurationSec, newPlays, newGenre, idGrupoMusical, where))
                return("Musica atualizada com sucesso")
            except:
                return("Musica nao encontrada")
        except:
            return("Grupo Musical nao encontrado")

    def deleteMusica(self, name):
        commandString = "DELETE FROM musica WHERE nome = '%s';"
        try:
            cur.execute(commandString % name)
            return("Musica deletada com sucesso")
        except:
            return("Musica nao encontrada")


class PlaylistCompostaPorMuisca():
    cur = 0
    def __init__(self, cur):
        self.cur = cur
    
    def createPlaylistCompostaPorMusica(self, namePlaylist, nameMusic):
        commandString = "INSERT INTO playlistcompostapormusica(fk_playlist_idplaylist, fk_musica_idmusica) VALUES ('%s', '%s');"
        commandStringIdPlaylist = "SELECT * FROM playlist WHERE nome = '%s' LIMIT 1;"
        commandStringIdMusica = "SELECT * FROM Musica WHERE nome = '%s' LIMIT 1;"
        try:
            cur.execute(commandStringIdPlaylist % namePlaylist)
            query = cur.fetchall()
            idPlaylist = query[0][0]
            cur.execute(commandStringIdMusica % nameMusic)
            query = cur.fetchall()
            idMusica = query[0][0]
            try:
                cur.execute(commandString % (idPlaylist, idMusica))
                return("Playlist Atualizada!")
            except:
                return("Falha ao atualzar")
        except:
            return("Musica ou Playlist nao econtrado")

    def readPlaylistCompostaPorMusica(self, idPlaylist):
        commandString = "SELECT * FROM playlistcompostapormusica WHERE fk_playlist_idplaylist = '%s';"
        try:
            cur.execute(commandString % idPlaylist)
            query = cur.fetchall()
            # for a in query:
            #     print(a)
            return(query)
        except:
            return("Playlist nao encontrada")
    def updatePlaylistCompostaPorMusica(self, idPlaylist, idMusic, newIdPlaylist, newIdMusic):
        commandString = "UPDATE playlistcompostapormusica SET fk_playlist_idplaylist = '%s', fk_musica_idmusica = '%s' WHERE fk_playlist_idplaylist = '%s' AND fk_musica_idmusica = '%s';"
        try:
            cur.execute(commandString % (newIdPlaylist, newIdMusic, idPlaylist, idMusic))
            #print("Playlist atualizada")
        except:
            #print("Erro")
            pass
    def deletePlaylistCompostaPorMusica(self, idPlaylist, idMusic):
        commandString = "DELETE FROM playlistcompostapormusica WHERE fk_playlist_idplaylist = '%s' AND fk_musica_idmusica = '%s';"
        try:
            cur.execute(commandString % (idPlaylist, idMusic))
            #print("Musica removida da playlist com sucesso")
        except:
            #print("Musica nao encontrada na playlist")
            pass

class main():
    cur = 0
    def __init__(self, cur):
        self.cur = cur
    def menu(self):
        choice = 0
        print("BEM VINDO AO BD")
        person = Pessoa(cur)
        grupoMusical = GrupoMusical(cur)
        playlist = Playlist(cur)
        music = Musica(cur)
        playlistComposite = PlaylistCompostaPorMuisca(cur)
        while(choice < 5):
            print("1 - Create, 2 - Read, 3 - Update, 4 - Delete, 5 - Quit")
            choice = int(input())
            if(choice == 1):
                playlistComposite.createPlaylistCompostaPorMusica(7, 17)
            if(choice == 2):
                playlistComposite.readPlaylistCompostaPorMusica(7)
            if(choice == 3):
                playlistComposite.updatePlaylistCompostaPorMusica(7, 17, 6, 17)
            if(choice == 4):
                playlistComposite.deletePlaylistCompostaPorMusica(6, 17)
            if(choice > 4 or choice < 1):
                if(choice >= 5):
                    #print("Bye!!")
                    pass

try:
    #conn = psycopg2.connect("dbname ='trabalhoBD' user ='postgres' host='localhost' password ='123'")
    conn = psycopg2.connect("dbname ='dbmua24rgvgc97' user ='dxeahhxxlwhskq' host='ec2-18-214-211-47.compute-1.amazonaws.com' password ='9800bdae87df94c913f6bf215c8daed2247e3b49b040eae789273d5190766137'")
    #print("Connected to the database")
    conn.autocommit = True
    cur = conn.cursor()
    main = main(cur)
    main.menu()
except:
    #print("Connection Failed")
    pass