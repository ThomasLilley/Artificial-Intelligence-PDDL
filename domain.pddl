;;Domain for cleaning floor tiles
;; A domain file for CMP2020M assignment 2016/2017

;; Define the name for this domain (needs to match the domain definition
;;   in the problem files)

;; Solution - Thomas Lilley 2017

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
  ;; here are the preconditions for clean up,
  ;; firstly the location of the robot must be determined,
  ;; once this is complete the tile above the robots current position
  ;; must be checked to ensure that there is not another robot in the
  ;; way, after that the tile above has not already been cleaned
  ;; if all these parameters are met then the program moves onto
  ;; effects, if not the program returns 'false' and starts over from the
  ;; beginning.
  :precondition (and
                 (robot-at ?r ?y)                
				(up ?x ?y)
                (clear ?x)    
                (not(cleaned ?x)) 
 )
  ;; If the above requirents are met then the tile state above the
  ;; robot will be changed to true
  :effect (and
           (cleaned ?x)
					)
 ) 

 (:action clean-down
  :parameters (?r - robot ?y - tile ?x - tile)
  ;; This is essentially the same function as clean-up but instead it is
  ;; checking the tile below the robot, again if the preconditions are	
  ;; met then the effects can be initialised
  :precondition (and
                 (robot-at ?r ?y)                
				(down ?x ?y)
                (clear ?x)     
                (not(cleaned ?x))
 )                     
  :effect (and
           (cleaned ?x)
           )	      
 )

 ;; Movement action definitions
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

