<?php

class NParse extends CModel
{
 //public static $_attributes;
 

 
 private $_new=true;
 
 private $names;
 
 private $className;

 
 protected static $_embeddedConfig = array();
 

 private					$_criteria		= null;			// query criteria (used by finder only)
 
// private $_models;
 
 private		static		$_models		= array();
 
 protected				$useCursor		= null;			// Whatever to return cursor instead on raw array

	/**
	 * @var boolean $ensureIndexes whatever to check and create non existing indexes of collection
	 * @since v1.1
	 */
 protected				$ensureIndexes	= true;			// Whatever to ensure indexes
 
 	/**
	 * Static array that holds mongo collection object instances,
	 * protected access since v1.3
	 *
	 * @var array $_collections static array of loaded collection objects
	 * @since v1.3
	 */
 protected	static		$_collections	= array();		// MongoCollection objec


	
	
 
  
  public function __construct()
  { 
    
        $this->className=get_class($this);
        
        $class=new ReflectionClass($this->className);
			$names=array();
			foreach($class->getProperties() as $property)
			{
				$name=$property->getName();
				if($property->isPublic() && !$property->isStatic())
					$names[]=$name;
			}
			
     $this->names=$names;			
     
     if(!empty($this->id))
      {
        $this->setIsNewRecord(false);
      }
  }
  
  	/**
	 * Returns the mongo criteria associated with this model.
	 * @param boolean $createIfNull whether to create a criteria instance if it does not exist. Defaults to true.
	 * @return EMongoCriteria the query criteria that is associated with this model.
	 * This criteria is mainly used by {@link scopes named scope} feature to accumulate
	 * different criteria specifications.
	 * @since v1.0
	 */
	public function getDbCriteria($createIfNull=true)
	{
		if($this->_criteria===null)
			if(($c = $this->defaultScope()) !== array() || $createIfNull)
				$this->_criteria = new NParseCriteria($c);
		return $this->_criteria;
	}
  
  /**
	 * Set girrent object, this will override proevious criteria
	 *
	 * @param EMongoCriteria $criteria
	 * @since v1.0
	 */
	public function setDbCriteria($criteria)
	{
		if(is_array($criteria))
			$this->_criteria = new NParseCriteria($criteria);
		else if($criteria instanceof NParseCriteria)
			$this->_criteria = $criteria;
		else
			$this->_criteria = new NParseCriteria();
	}
	
	/**
	 * Returns the default named scope that should be implicitly applied to all queries for this model.
	 * Note, default scope only applies to SELECT queries. It is ignored for INSERT, UPDATE and DELETE queries.
	 * The default implementation simply returns an empty array. You may override this method
	 * if the model needs to be queried with some default criteria (e.g. only active records should be returned).
	 * @return array the mongo criteria. This will be used as the parameter to the constructor
	 * of {@link EMongoCriteria}.
	 * @since v1.2.2
	 */
	public function defaultScope()
	{
		return array();
	}
  

    
  public static function model($className=__CLASS__)
      {
	      if(isset(self::$_models[$className]))
		      return self::$_models[$className];
	      else
	      {
	         
		      $model=self::$_models[$className]=new $className(null);
		      $model->attachBehaviors($model->behaviors());
		      return $model;
	      }
	     
      }
    
	 
 
 public function save($runValidation=true,$attributes=null)
 {
    if(!$runValidation || $this->validate($attributes))
			return $this->getIsNewRecord() ? $this->insert($attributes) : $this->update($attributes);
		else
			return false;
 }			
 public function insert()
 {

   $URL="https://api.parse.com/1/classes/".$this->className;
   

   $data=$this->attributes;
   
  
   //$data['id']=array("__op"=>"Increment","amount"=>1);
   //$data['test']=array("__op"=>"Increment","amount"=>1);
   
   //$data['test']='hello';
    //$data["id"]=345678;
    
    /*
     echo "<pre>";
     print_r($data);
     echo "</pre>";
     */
   //exit;
    
    $ch = curl_init();
      $curlConfig = array(
	  CURLOPT_URL            => $URL,
	  CURLOPT_POST           => true,
	  CURLOPT_HTTPHEADER => array(
	                               "X-Parse-Application-Id:".Yii::app()->params['parse_app_id'],
	                               "X-Parse-REST-API-Key:".Yii::app()->params['parse_api_key'],
                                       "Content-Type: application/json",
                                     ),
                                   CURLOPT_NOBODY=> 0,
                                   CURLOPT_USERAGENT=> "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6",
	  CURLOPT_RETURNTRANSFER => true,
	  CURLOPT_FOLLOWLOCATION=>true,
	  CURLOPT_POSTFIELDS     => json_encode($data),
      );
      curl_setopt_array($ch, $curlConfig);

      $content = curl_exec($ch);
      
      $response=json_decode($content);
      
      /*
      echo "<hr/><pre>";
      print_r($response);
      echo "</pre>";
       */
     if(!empty($response->objectId))
     {
      $this->setIsNewRecord(false);
      //$this->id=$response->id;
      //$this->id=$response->objectId;
     } 
      
   return(true);
 }
 
 public function findbyPk($id)
 {
   
    $URL="https://api.parse.com/1/classes/".$this->className."/".$id;
 
  // echo "Url:".$URL;
   
    $ch = curl_init();
      $curlConfig = array(
	  CURLOPT_URL            => $URL,
	 // CURLOPT_POST           => false,
	  CURLOPT_HTTPHEADER => array(
	                               "X-Parse-Application-Id:".Yii::app()->params['parse_app_id'],
	                               "X-Parse-REST-API-Key:".Yii::app()->params['parse_api_key'],
                                     ),
                                  // CURLOPT_NOBODY=> 0,
                                   CURLOPT_USERAGENT=> "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6",
	  CURLOPT_RETURNTRANSFER => true,
	  CURLOPT_FOLLOWLOCATION=>true,
	  //CURLOPT_POSTFIELDS     => json_encode($this->attributes),
      );
      curl_setopt_array($ch, $curlConfig);

      $content = curl_exec($ch);
      
      $response=json_decode($content);
      
   
       if(isset($response->code)&&$response->code==101)
        {
         return(null);
        }
        /*
         echo "<pre>Resp:"; 
     print_r($response);
     echo "</pre>";
        */
     $this->attributes=get_object_vars($response);
        
     $this->id=$response->objectId;   
     $this->setIsNewRecord(false);
     
     
     /*
     echo "<pre>Resp:"; 
     print_r($response);
     echo "</pre>";
     exit;
     */
     //$model=get_class($this);
  
     
     
     //return $this->populateRecord($response);
     
     /*
     echo "<pre>current:";
     print_r($this->attributes);
     echo "</pre>";
     */
   
     return($this);
  
 }
 public function delete($id)
 {
   
    $URL="https://api.parse.com/1/classes/".$this->className."/".$id;
 
  // echo "Url:".$URL;
   
    $ch = curl_init();
      $curlConfig = array(
	  CURLOPT_URL            => $URL,
	  CURLOPT_CUSTOMREQUEST=>"DELETE",
	  CURLOPT_HTTPHEADER => array(
	                               "X-Parse-Application-Id:".Yii::app()->params['parse_app_id'],
	                               "X-Parse-REST-API-Key:".Yii::app()->params['parse_api_key'],
                                     ),
                                  // CURLOPT_NOBODY=> 0,
                                   CURLOPT_USERAGENT=> "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6",
	  CURLOPT_RETURNTRANSFER => true,
	  CURLOPT_FOLLOWLOCATION=>true,
      );
      curl_setopt_array($ch, $curlConfig);

      $content = curl_exec($ch);
      
      $response=json_decode($content);
      
   
     return(true);
  
 }
  public static $operators = array(
		'greater'		=> '$gt',
		'>'			=> '$gt',
		'greatereq'		=> '$gte',
		'>='			=> '$gte',
		'less'			=> '$lt',
		'<'			=> '$lt',
		'lesseq'		=> '$lte',
		'<='			=> '$lte',
		'noteq'			=> '$ne',
		'!='			=> '$ne',
		'<>'			=> '$ne',
		'in'			=> '$in',
		'notin'			=> '$nin',
		'all'			=> '$all',
		'size'			=> '$size',
		'type'			=> '$type',
		'exists'		=> '$exists',
		'notexists'		=> '$exists',
		'elemmatch'		=> '$elemMatch',
		'mod'			=> '$mod',
		'%'			=> '$mod',
		'equals'		=> '$$eq',
		'eq'			=> '$$eq',
		'=='			=> '$$eq',
		'where'			=> '$where',
		'or'			=> '$or'
		
	);
	
 public function findAll($criteria=null)
 {
   
    $URL="https://api.parse.com/1/classes/".$this->className."?"."where={\"name\":\"^\Qa\E\"}";
 
   //echo "Url:".$URL;
   
          if($criteria!=null)
          {
            $this->setCriteria($criteria);
          
             $condition=array();
              $c=$this->_criteria->condition->getConditions();
              
              /*
              echo "<pre>";
              print_r($c);
              echo "</pre>";
              */
             // exit;
            
                   
                           if(isset($c['conditions']))
			    foreach($c['conditions'] as $k=>$p)
			      {
			      $this->_criteria->addCond($k,$p[0],$p[1]);
			      }
			      $c=$this->_criteria->condition->getConditions();
			      
			    
			      foreach($c as $k=>$p)
			      {
			      if($k=="conditions"||$k=="limit"||$k=="order"||$k=="offset"||$k=="select"||$k=="condition.condition.limit")
			      continue;
			      $condition[$k]=$p;
			    
			      }
	      
	 
	       $data=array();
	      
	      if(count($condition)>0)
	       {
	            /*
	             echo "<br/>condition:";
		      echo "<pre>";
		      print_r($condition);
		      echo "</pre>";
	              */
	        $condition=json_encode($condition);
	        echo "<br/>json Condition".$condition; 
	        $data['where']=$condition;
	       // $URL.="where=".$condition;
	       }
	       
	       
	        if(isset($c['condition.condition.limit']))
	        {
	         $data['limit']=$c['condition.condition.limit'];
	         //$URL.="?limit=".$c['limit'];
	        }
	       else if(isset($c['limit']))
	        {
	         $data['limit']=$c['limit'];
	         //$URL.="?limit=".$c['limit'];
	        }
	        
	        if(isset($c['order']))
	        {
	         $data['order']=$c['order'];
	         //$URL.="?limit=".$c['limit'];
	        }
	        if(isset($c['sort']))
	        {
	         $data['sort']=$c['sort'];
	         //$URL.="?limit=".$c['limit'];
	        }
	        
	        if(isset($c['offset']))
	        {
	         $data['skip']=$c['offset'];
	         //$URL.="?limit=".$c['limit'];
	        }
	        if(isset($c['select']))
	        {
	         $data['keys']=$c['select'];
	         //$URL.="?limit=".$c['limit'];
	        }
	        
	        $data=http_build_query($data);
	        $URL.=$data;
	       echo "Url:".$URL;
	        
	       //if(isse)
	      // $URL=urlencode($URL);
            //  exit;
          
	  }    
          
         
          
          
        
         // echo "Params count:".$criteria->paramCount;
          
         // exit;
   
    $ch = curl_init();
      $curlConfig = array(
	  CURLOPT_URL            => $URL,
	 // CURLOPT_POST           => false,
	  CURLOPT_HTTPHEADER => array(
	                               "X-Parse-Application-Id:".Yii::app()->params['parse_app_id'],
	                               "X-Parse-REST-API-Key:".Yii::app()->params['parse_api_key'],
	                              // "--data-urlencode"=>'where='.$condition,
                                     ),
                                  // CURLOPT_NOBODY=> 0,
                                   CURLOPT_USERAGENT=> "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6",
	  CURLOPT_RETURNTRANSFER => true,
	  CURLOPT_FOLLOWLOCATION=>true,
	  //CURLOPT_POSTFIELDS     => json_encode($this->attributes),
      );
      curl_setopt_array($ch, $curlConfig);

      $content = curl_exec($ch);
      
      $response=json_decode($content);
      
   
       if(isset($response->code)&&$response->code==101)
        {
         return(false);
        }
        
    
     echo "<pre>Resp:"; 
     print_r($response);
     echo "</pre>";
     
      echo "Url:".urldecode($URL);
   
     //exit;
     
      // echo "ClassName:".$this->className;
     //  exit;
        
        $rows=array();
        
      if(isset($response->results))
       {
         
         $i=0;
   
         
         foreach($response->results as $row)
         {
	     //$model=$this->model();
	     $model=new $this->className;
             $model->attributes=get_object_vars($row);
             $model->id=$row->objectId;
             
            /* echo "<pre>".($i+1).":"; 
             print_r($model->attributes);
             echo "</pre>";
             */
             $rows[]=$model; 
            // $rows[]=$model->attributes;
        
           $i++;
         }
         //echo "<hr/>";
       }



     return($rows);
  
 }
 
 public function setCriteria($criteria)
	{
		if(is_array($criteria))
			$this->_criteria = new NParseCriteria($criteria);
		else if($criteria instanceof NParseCriteria)
			$this->_criteria = $criteria;
	}
	
 public function count($criteria=null)
 {
   
    $URL="https://api.parse.com/1/classes/".$this->className."?";
 
   //echo "Url:".$URL;
   
          if($criteria!=null)
          {
            $this->setCriteria($criteria);
          
             $condition=array();
              $c=$this->_criteria->condition->getConditions();
              
              /*
              echo "<pre>";
              print_r($c);
              echo "</pre>";
              */
             // exit;
            
                   
                           if(isset($c['conditions']))
			    foreach($c['conditions'] as $k=>$p)
			      {
			      $this->_criteria->addCond($k,$p[0],$p[1]);
			      }
			      $c=$this->_criteria->condition->getConditions();
			      
			    
			      foreach($c as $k=>$p)
			      {
			      if($k=="conditions"||$k=="limit"||$k=="order"||$k=="offset"||$k=="select"||$k=="condition.condition.limit")
			      continue;
			      $condition[$k]=$p;
			    
			      }
	      
	 
	       $data=array();
	      
	      if(count($condition)>0)
	       {
	            /*
	             echo "<br/>condition:";
		      echo "<pre>";
		      print_r($condition);
		      echo "</pre>";
	              */
	        $condition=json_encode($condition);
	       // echo "<br/>json Condition".$condition; 
	        $data['where']=$condition;
	       // $URL.="where=".$condition;
	       }
	       
	       
	        if(isset($c['condition.condition.limit']))
	        {
	         $data['limit']=$c['condition.condition.limit'];
	         //$URL.="?limit=".$c['limit'];
	        }
	       else if(isset($c['limit']))
	        {
	         $data['limit']=$c['limit'];
	         //$URL.="?limit=".$c['limit'];
	        }
	        
	        if(isset($c['order']))
	        {
	         $data['order']=$c['order'];
	         //$URL.="?limit=".$c['limit'];
	        }
	        if(isset($c['sort']))
	        {
	         $data['sort']=$c['sort'];
	         //$URL.="?limit=".$c['limit'];
	        }
	        
	        if(isset($c['offset']))
	        {
	         $data['skip']=$c['offset'];
	         //$URL.="?limit=".$c['limit'];
	        }
	        if(isset($c['select']))
	        {
	         $data['keys']=$c['select'];
	         //$URL.="?limit=".$c['limit'];
	        }
	         $data['count']=1;
	        $data=http_build_query($data);
	        $URL.=$data;
	       echo "Url:".$URL;
	        
	       //if(isse)
	      // $URL=urlencode($URL);
            //  exit;
          
	  }    
          
         
          
          
        
         // echo "Params count:".$criteria->paramCount;
          
         // exit;
   
    $ch = curl_init();
      $curlConfig = array(
	  CURLOPT_URL            => $URL,
	 // CURLOPT_POST           => false,
	  CURLOPT_HTTPHEADER => array(
	                               "X-Parse-Application-Id:".Yii::app()->params['parse_app_id'],
	                               "X-Parse-REST-API-Key:".Yii::app()->params['parse_api_key'],
	                              // "--data-urlencode"=>'where='.$condition,
                                     ),
                                  // CURLOPT_NOBODY=> 0,
                                   CURLOPT_USERAGENT=> "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6",
	  CURLOPT_RETURNTRANSFER => true,
	  CURLOPT_FOLLOWLOCATION=>true,
	  //CURLOPT_POSTFIELDS     => json_encode($this->attributes),
      );
      curl_setopt_array($ch, $curlConfig);

      $content = curl_exec($ch);
      
      $response=json_decode($content);
      
      /*
      echo "<pre>";
      print_r($response);
      echo "</pre>";
      */
    //  exit;
      
   
       if(isset($response->code)&&$response->code==101)
        {
         return(false);
        }
        
  if(isset($response->count))
   return($response->count);
  else  
   return(0);
  
 }

 /*
 public function findAll($criteria=null)
	{
		Yii::trace(get_class($this).'.findAll()','ext.MongoDb.EMongoDocument');

		if($this->beforeFind())
		{
			$this->applyScopes($criteria);

			$cursor = $this->model()->find($criteria->getConditions());

			if($criteria->getSort() !== null)
				$cursor->sort($criteria->getSort());
			if($criteria->getLimit() !== null)
				$cursor->limit($criteria->getLimit());
			if($criteria->getOffset() !== null)
				$cursor->skip($criteria->getOffset());
			if($criteria->getSelect())
				$cursor->fields($criteria->getSelect(true));

			if($this->getUseCursor($criteria))
				return new NParseCursor($cursor, $this->model());
			else
				return $this->populateRecords($cursor);
		}
		return array();
	}
*/	
	
/**
	 * Returns current MongoCollection object
	 * By default this method use {@see getCollectionName()}
	 * @return MongoCollection
	 * @since v1.0
	 */
	public function getCollection()
	{
	   if(!isset(self::$_collections[$this->getCollectionName()]))
			self::$_collections[$this->getCollectionName()] = $this->getDb()->selectCollection($this->getCollectionName());

		return self::$_collections[$this->getCollectionName()];
		/*
		if(!isset(self::$_collections[$this->getCollectionName()]))
			self::$_collections[$this->getCollectionName()] = $this->getDb()->selectCollection($this->getCollectionName());

		return self::$_collections[$this->getCollectionName()];
	      */
	}

	
/**
	 * This method is invoked before an AR finder executes a find call.
	 * The find calls include {@link find}, {@link findAll}, {@link findByPk},
	 * {@link findAllByPk}, {@link findByAttributes} and {@link findAllByAttributes}.
	 * The default implementation raises the {@link onBeforeFind} event.
	 * If you override this method, make sure you call the parent implementation
	 * so that the event is raised properly.
	 *
	 * Starting from version 1.1.5, this method may be called with a hidden {@link CDbCriteria}
	 * parameter which represents the current query criteria as passed to a find method of AR.
	 * @since v1.0
	 */
	protected function beforeFind()
	{
		if($this->hasEventHandler('onBeforeFind'))
		{
			$event=new CModelEvent($this);
			$this->onBeforeFind($event);
			return $event->isValid;
		}
		else
			return true;
	}
	
/**
	 * Applies the query scopes to the given criteria.
	 * This method merges {@link dbCriteria} with the given criteria parameter.
	 * It then resets {@link dbCriteria} to be null.
	 * @param EMongoCriteria|array $criteria the query criteria. This parameter may be modified by merging {@link dbCriteria}.
	 * @since v1.2.2
	 */
	public function applyScopes(&$criteria)
	{
		if($criteria === null)
		{
			$criteria = new NParseCriteria();
		}
		else if(is_array($criteria))
		{
			$criteria = new NParseCriteria($criteria);
		}
		else if(!($criteria instanceof NParseCriteria))
			throw new NParseException('Cannot apply scopes to criteria');

		if(($c=$this->getDbCriteria(false))!==null)
		{
			$c->mergeWith($criteria);
			$criteria=$c;
			$this->_criteria=null;
		}
	}
	
 
 public function update()
 {
 
   $URL="https://api.parse.com/1/classes/".$this->className."/".$this->id;
 
   
     /*
     echo "<pre>before update:"; 
     print_r($this->attributes);
     echo "</pre>";
     */
    $ch = curl_init();
      $curlConfig = array(
	  CURLOPT_URL            => $URL,
	 // CURLOPT_POST           => false,
	  //CURLOPT_CUSTOMREQUEST           => true,
	  CURLOPT_CUSTOMREQUEST=>"PUT",
	 // CURLOPT_PUT=>true,
	 // curl_setopt($ch, CURLOPT_PUT, TRUE);
	  
	  CURLOPT_HTTPHEADER => array(
	                               "X-Parse-Application-Id:".Yii::app()->params['parse_app_id'],
	                               "X-Parse-REST-API-Key:".Yii::app()->params['parse_api_key'],
                                       "Content-Type: application/json",
                                     ),
                                   CURLOPT_NOBODY=> 0,
                                   CURLOPT_USERAGENT=> "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6",
	  CURLOPT_RETURNTRANSFER => true,
	  CURLOPT_FOLLOWLOCATION=>true,
	  CURLOPT_POSTFIELDS     => json_encode($this->attributes),
      );
      curl_setopt_array($ch, $curlConfig);

      $content = curl_exec($ch);
      
      $response=json_decode($content);
 
     if(!empty($response->objectId))
     {
      $this->setIsNewRecord(false);
      $this->id=$response->objectId;
     } 
     
     /*
     
      echo "<pre>after update:"; 
     print_r($response);
     echo "</pre>";
      */
     if(!empty($response->updatedAt))
     return(true);
    else
     return(false);
 }
 
 
 
 public function getIsNewRecord()
	{
		return $this->_new;
	}

 public function setIsNewRecord($value)
	{
		$this->_new=$value;
	}

 
 public function attributeNames()
	{
	    
           return($this->names);
    
	}

}
?>