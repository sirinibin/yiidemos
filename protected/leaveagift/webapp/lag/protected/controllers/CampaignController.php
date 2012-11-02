<?php
require_once(dirname(__FILE__).'/../extensions/facebook/fb-php-sdk/facebook.php');

class CampaignController extends CController
{
 public $layout="campaign";

    public function filters()
    {
        return array(
               'permission + PapaCJCongrats',
               'users + PapaCJCongrats',
        );
    }



 public function filterPermission($filterChain)
       {
         header('P3P: CP="HONK"');
         $session=new CHttpSession;
         $session->open();	
         $facebook = new Facebook(array(
            'appId'  => Yii::app()->params['facebook_appId'],
            'secret' => Yii::app()->params['facebook_appSecret'],
            'cookie' => true,
            //'oauth' => true,   
               ));
         $facebook->setExtendedAccessToken();
         $access_token = $facebook->getExtendedAccessToken();
          

   
            try{
                
                 $session['me']=$facebook->api("/me");
  
                 $criteria=new CDbCriteria;
                 $criteria->condition="facebook_userid=:facebook_userid";
            
                 $criteria->params=array(':facebook_userid'=>$session['me']['id']);
                 
                   $user=User::model()->find($criteria);
                  // echo "c:".count($user).$user->name;
              
                 if($user==null)
                  {
                      
                    $me=$session['me'];
                    $user=new User;
                    $user->facebook_userid=$me['id']; 
                    $user->facebook_oauthid=$access_token;
                    $user->facebook_email=$me['email'];
                    $user->name=$me['name'];
                    $user->date_add=date('Y-m-d H:i:s',time()); 
                    $user->date_upd=date('Y-m-d H:i:s',time());  
                    $user->save(false);
                    $user->addAddress();      
              
                  }
                
                 // $this->redirect(Yii::app()->createAbsoluteUrl("campaign/PapaCJCongrats"));
                
               }
              catch(Exception $e)
               { 
                 $this->redirect(array("campaign/askPermission"));
               }

          Yii::import('application.extensions.facebook.identities.*');
   
   	   $identity=new CFBUserIdentity();
			if($identity->authenticate())
			{
			   Yii::app()->user->login($identity);
                        }
                       else
                         {
                          
                            $this->redirect(array('campaign/PapaCj'));
                         }

     if(!$user->isContributedInPapaCJ())
       {
        $pcj=new Papacj;
        $pcj->id_user=$user->id_user;
        $pcj->date_add=date('Y-m-d H:i:s',time());
        $pcj->date_upd=date('Y-m-d H:i:s',time());
        $pcj->save(false);
       }
     
       
     $filterChain->run();
      }
 public function filterUsers($filter)
 {
   if(Yii::app()->user->isGuest)
		{
                  
                  //echo "guest";
                  //exit;
			//TODO - define home url and redirect to home url - $this->redirect(Yii::app()->homeUrl);
			//$this->redirect(array("receiver/receiverLogin"));
                        $this->redirect(array("campaign/PapaCj"));
		}

  $filter->run();

 }
  public function actionAskPermission()
        {
         $session=new CHttpSession;
         $session->open(); 
         $facebook = new Facebook(array(
            'appId'  => Yii::app()->params['facebook_appId'],
            'secret' => Yii::app()->params['facebook_appSecret'],
            'cookie' => false,
               )); 
             

         $params=array(
                        'scope' => Yii::app()->params['facebook_scope'],
                        'redirect_uri' => Yii::app()->createAbsoluteUrl('campaign/PapaCJCongrats')
                      );
         $auth_url=$facebook->getLoginUrl($params);

         echo("<script> top.location.href='" . $auth_url . "'</script>");
             

        }
 public function actionPapaCj()
 {
  $this->render('papacj');
 }

 public function actionPapaCJCongrats()
 {
           
  $this->layout="receiver";

  $this->render('congratspapacj');
 }

}

?>
