var database = require("../database/config");


function pegarEstufasModel(idCliente) {
    instrucaoSql = `select * from
                    estufa where 
                     estufa.idCliente = ${idCliente}`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
function pegarSensoresModel(idEstufa) {
    instrucaoSql = `select * from
                    sensor where 
                     sensor.idEstufa = ${idEstufa}`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
function pegarMedidaModel(idSensor) {
    instrucaoSql = `select * from
                    medida where 
                    medida.idSensor = ${idSensor}
                    order by idMedida desc`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
function buscarMedidasEmTempoReal(idAquario) {
    instrucaoSql = `select 
                        temperatura, 
                        umidade, DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
                        fk_aquario 
                        from medida where fk_aquario = ${idAquario} 
                    order by id desc limit 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    pegarEstufasModel,
    pegarSensoresModel,
    pegarMedidaModel,
    buscarMedidasEmTempoReal
}