DELIMITER //

CREATE TRIGGER update_service_available_spots
AFTER UPDATE ON POPULATION
FOR EACH ROW
BEGIN
    UPDATE SERVICE s
    JOIN (
        SELECT 
            pr.PID,
            pr.Capacity,
            IFNULL(po.Occupancy, 0) AS Occupancy,
            CASE 
                WHEN (pr.Capacity - IFNULL(po.Occupancy, 0)) > 0 THEN (pr.Capacity - IFNULL(po.Occupancy, 0))
                ELSE 0
            END AS Available_Spots
        FROM 
            PROGRAM pr
        LEFT JOIN 
            POPULATION po ON pr.PID = po.PID
    ) AS temp ON s.PID = temp.PID
    SET 
        s.Available_Spots = temp.Available_Spots;
END //

DELIMITER ;
