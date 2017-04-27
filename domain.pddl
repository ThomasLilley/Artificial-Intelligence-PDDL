;;Domain for cleaning floor tiles
;; A domain file for CMP2020M assignment 2016/2017

;; Define the name for this domain (needs to match the domain definition
;;   in the problem files)

(define (domain floor-tile)

	;; We only require some typing to make this plan faster. We can do without!
	(:requirements :typing)

	;; We have two types: robots and the tiles, both are objects
	(:types robot tile - object)

	;; define all the predicates as they are used in the probem files
	(:predicates  

    ;; described what tile a robot is at
    (robot-at ?r - robot ?x - tile)

    ;; indicates that tile ?x is above tile ?y
    (up ?x - tile ?y - tile)

    ;; indicates that tile ?x is below tile ?y
    (down ?x - tile ?y - tile)

    ;; indicates that tile ?x is right of tile ?y
    (right ?x - tile ?y - tile)

    ;; indicates that tile ?x is left of tile ?y
    (left ?x - tile ?y - tile)
    
    ;; indicates that a tile is clear (robot can move there)
    (clear ?x - tile)

    ;; indicates that a tile is cleaned
    (cleaned ?x - tile)
 	)


;; Action definitions, e.g. 


 (:action clean-up
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and
                 (robot-at ?r ?y)                
				(up ?x ?y)
                 ;;Checks if the tile above is clear
                (clear ?x)  
                 ;;Checks the tile above hasn't already been cleaned    
                (not(cleaned ?x)) 
 )
  :effect (and
           (cleaned ?x)
					)
 ) 

 (:action clean-down
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and
                 (robot-at ?r ?y)                
				(down ?x ?y)
                 ;;Checks if the tile below is clear
                (clear ?x)  
                 ;;Checks the tile below hasn't already been cleaned    
                (not(cleaned ?x))
              	)            
								
          
  :effect (and
           (cleaned ?x)
           )	      
 )


 (:action up 
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and
                 (robot-at ?r ?y)                
				(up ?x ?y)
                 ;;Checks if the tile below is clear
                (clear ?x)  
                 ;;Checks the tile below isn't cleaned    
                (not(cleaned ?x)) 
                     )
		   ;;moves the robot up				
  :effect (and
           		(robot-at ?r ?x)
          		;;makes the previous tile the robot was on clear
          		(not(robot-at ?r ?y))
          		(not(clear ?x))              
          		(clear ?y)
           )       
 )


 (:action down 
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and 
               	(robot-at ?r ?y)                
				(down ?x ?y)
                 ;;Checks if the tile below is clear
                (clear ?x)  
                 ;;Checks the tile below isn't cleaned    
                (not(cleaned ?x))
                 )          
		   ;;moves the robot down					
  :effect (and (robot-at ?r ?x)
          ;;makes the previous tile the robot was on clear
          (not(robot-at ?r ?y))
          (not( clear ?x))             
          (clear ?y)
        	)      
 )

  (:action right 
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and(robot-at ?r ?y)                
				(right ?x ?y)
                 ;;Checks if the tile below is clear
                (clear ?x)  
                 ;;Checks the tile below isn't cleaned    
                (not(cleaned ?x))
              	)             
		   ;;moves the robot right
  :effect (and (robot-at ?r ?x)
          ;;makes the previous tile the robot was on clear
          (not(robot-at ?r ?y))
          (not(clear ?x))             
          (clear ?y)
     		)      
 )


 (:action left 
  :parameters (?r - robot ?y - tile ?x - tile)
  :precondition (and (robot-at ?r ?y)                
				(left ?x ?y)
                 ;;Checks if the tile below is clear
                (clear ?x)  
                 ;;Checks the tile below isn't cleaned    
                (not(cleaned ?x))  
              	)          
		   ;;moves the robot left					)
  :effect (and
           	(robot-at ?r ?x)
          ;;makes the previous tile the robot was on clear
          	(not(robot-at ?r ?y))
          	(not(clear ?x))             
          	(clear ?y)
           )
 )
)  

