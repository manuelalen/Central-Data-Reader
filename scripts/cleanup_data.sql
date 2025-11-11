DELETE FROM DEV_BRONCE_CARS_PROPERTIES.CP_STG.D_CARS AS T
USING (
  SELECT
    matricula,
    dni_propietario,
    marca_vehiculo,
    provincia,
    municipio,
    fecha_propietario,
    T_REC_INS_TST,
    T_REC_UPD_TST,
    ROW_NUMBER() OVER (
      PARTITION BY matricula
      ORDER BY
        COALESCE(
          TRY_TO_DATE(fecha_propietario,'YYYY-MM-DD'),
          TRY_TO_DATE(fecha_propietario,'DD/MM/YYYY')
        ) DESC,
        COALESCE(T_REC_UPD_TST, T_REC_INS_TST) DESC
    ) AS rn
  FROM DEV_BRONCE_CARS_PROPERTIES.CP_STG.D_CARS
) S
WHERE
  S.rn > 1
  AND T.matricula         = S.matricula
  AND T.dni_propietario   = S.dni_propietario
  AND T.marca_vehiculo    = S.marca_vehiculo
  AND NVL(T.provincia,'') = NVL(S.provincia,'')
  AND NVL(T.municipio,'') = NVL(S.municipio,'')
  AND T.fecha_propietario = S.fecha_propietario
  AND NVL(T.T_REC_UPD_TST, T.T_REC_INS_TST) = NVL(S.T_REC_UPD_TST, S.T_REC_INS_TST);
