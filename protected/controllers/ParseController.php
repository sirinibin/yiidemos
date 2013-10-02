<?php

class ParseController extends Controller
{
       public function actionCreate()
        {
    
           $model=new ParseTest;
           $model->name="sirin";
           $model->age="123";
           
         
           
           if($model->save())
            {
              echo "saved"; 
              echo "<br/	>id:".$model->id;
            }
            else
            {
             $e=$model->getErrors();
             print_r($e);
            }
            
        }
        public function actionView($id)
        {
          $model=ParseTest::model()->findbyPk($id); 
          echo "<pre>Attributes:";
          print_r($model->attributes);
          echo "</pre>";
          
        }
        public function actionUpdate($id)
        {
          $model=ParseTest::model()->findbyPk($id); 
          
          $model->name="Sirin";
          $model->age="24";
          if($model->save())
            {
              echo "saved"; 
              echo "<br/>id:".$model->id;
            }
            else
            {
             $e=$model->getErrors();
             print_r($e);
            }
           $model->name="coool";
           $model->save();
        }
        public function actionIndex()
        {
          // $criteria=new NParseCriteria;
           //$criteria->condition="age>10";
           
           $criteria=new CDbCriteria;
           $criteria->condition="age>10 and test=:test";
           
          
             
           $criteria->limit="2";
           
           $criteria->addCondition("name='sirin'");
           
           $criteria->compare('age','555');
           $criteria->compare('name','abcdefg');
           $criteria->compare('name','fffffff',false,"OR");
           
           $criteria->params=CMap::mergeArray($criteria->params,array(':test'=>'123'));
           
           
           
          // echo "condition:".$criteria->condition;
           
           
           
           //exit;
           
           $models=ParseTest::model()->findAll($criteria); 
           
           foreach($models as $model)
            {
             echo "<pre>Attributes:";
             print_r($model->attributes);
             echo "</pre>";
            } 
        
        }
        public function actionDelete($id)
        {
          $model=ParseTest::model()->findbyPk($id); 
          if($model==null)
          {
            echo "No record exist to delete.. with id:".$id; 
          }
          else
          {
            echo "Deleted id:".$id;
            $res=$model->delete($id);
          }
          
        }
        

}