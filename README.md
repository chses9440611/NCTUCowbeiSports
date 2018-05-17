# Final Project Spec
:::danger
1. User can’t access the page for administrator only
2. Have to be a nav bar for every page
:::

## :star:Nav bar
**type1** => |首頁|活動列表|註冊|登入| 

**type2** => |首頁|活動列表|登出| ==> <font color="red">Administer</font>, User Login

++**Need to be discuss**++
- The position of *<font color="orange">Logout </font>*
   - [x] |首頁|活動列表|User_account|登出|
   - [ ] |首頁|活動列表|登出|
:::info
when push logout have to pop up a window to confirm log out
:::

:::warning
<font color="red">Red Requirements for Administer</font>
:::
## :star:home page 
* url: /
* Title: 最新公告
* Format:
    + |Posted Time1| Title1 |
|Posted Time1| Title1 |
|Posted Time1| Title1 |
    + <font color="red">|新增公告|
|Posted Time| Title | **Delete button**| </font>
* <font color="red">After push del button need pop-up window</font> 
* Click Title to Detail
    - [ ]button
    - [ ]block
    - [ ]hyperlink
* <font color="blue">Bonus : provide function to delete multi-annc</font> 
 
* Discuss
    * <font color="gray">The way to show the detail content, like Twitter, Facebook or tabs?</font>
---

## Announcement
-- url: /anncs
-- url: /anncs/id <== ?
-- Format:
   * Title
   * Posted Time
   * Content

-- Content: Text, <font color="blue">image, support markdown</font>


### :star:<font color="red">Announcement add</font>
-- url: /anncs/add
-- Format
  * Title
  * Content
  * :black_square_button: Post :black_square_button: Cancel
  
-- Record Post time when push Post button
-- Redirect to home?

### <font color="red">Announcement delete</font>
-- url: /anncs/delete
-- Redirect to home
-- Show delete success or not

### :heart:<font color="red">Announcement edit</font>
-- url: /anncs/edit
-- Format:
   * Title
   * Content
   *  :black_square_button: Save :black_square_button: Cancel 

-- <font color="gray">Renew Time ???</font>

## :star:Events
-- url: /events
--Title: 活動列表
-- Format:
   * User View

<div>
活動列表
    
| 項目 | 規則 | 報名 |
|:---:|:---:|:---:|
|足球|踢球|報名按鈕|
    
</div>

   * <font color="red">Admin View</font>
   <div>
活動列表
    
+++++++++++++++++++++++[新增活動按鈕]
| 項目 | 規則 | 報名 | 操作 |
|:---:|:---:|:---:|:---:|
|足球|踢球|報名按鈕|Edit_but, Status_but, Del_but|
    
</div>

### :star:<font color="red">Events status List </font>
-- url: /events/status
-- Title: 報名狀況
-- Format:

<div>
    Event1 name
 
 |隊伍名稱|隊伍成員|
 |:----:|:-----:|
 |TeamA |學號 名字|
</div>

<div>
    
    Event2 name

    尚無人報名
</div>

### :star:<font color="red">Events add</font>
-- url: /events/add    
-- Format:
   * 活動名稱
   * 活動日期
   * 隊伍限制
   * 每隊人數限制
   * 發佈_but 取消_but

--  <font color="blue">Bonus: Add more features</font>
 

### :star:<font color="red">Events edit</font>
-- url: /events/edit
-- Format:
   * 活動名稱
   * 活動日期
   * 隊伍限制
   * 每隊人數限制
   * 儲存_but 取消_but
### <font color="red">Events delete</font>
-- url: /events/delete
-- Pop up a window to confirm
-- After delete, redirect to /events
-- Notify delete success or not
-- <font color="blue">Bonus: is_delete to recover</font>

---

## :star:Event signup
-- url: /events/signup
-- Format:
**活動名稱**

:::info
Block to remind event limit
:::


-->隊伍名稱
-->隊伍人員
|隊員學號|姓名||
|:---:|:---:|:---:|
|03xxxxx|xxx|修改_btn 取消_btn|
|欄位| |新增隊員_btn|

提交報名表_btn

-- Design a way to avoid typo, like type student_id then auto show up/fill student name

-- Check if the team limit of the event

-- <font color="blue">Bonus:
* Sent email to all team memebers after sign up  
* Admin can sign up for others and ignore rules
</font>

### Event signup delete
-- url: /events/signup/delete
-- cancel btn clicked, pop a new window to confirm
-- redirect to /events
-- notify cancellation success or not

### :heart:Event signup edit
-- url: /events/signup/edit
-- Editable by Admin and User
-- Fileds like Sign up Event
-- prefill the origin info
-- Check team members limit
-- Avoid wrong student id
-- Edit btn and Cancel btn

**<font color="pink" size=6>Where to del and edit</font>**


---

## :star:Register
-- url: /register
-- Fomat
   * 學號
   * 信箱
   * 密碼
   * 確認密碼
   * 驗證碼(design ourselves)
   * 註冊btn 取消btn
  
-- redirect to home(/)
-- <font color="blue">Bonus:
   * auto generate string and send email to user and user have to fill the string sent 
   * after regist, auto generate unique link to verify 
</font>

---

## :star:Log in 
--url: /login
-- Format:
   * 學號
   * 密碼

-- Password must be encrypt
-- <font color="blue">Bonus:
   * password in db be hashed
</font>

---

## Log out
--url: /logout
-- Just a button
-- Redirect to home(/)

