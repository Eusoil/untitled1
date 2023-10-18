package xju.pojo;

public class Xinxi {

    private String nickname;
    private String qq;
    private String email;
    private String text;

    public Xinxi(){}
    public Xinxi(String nickname,String qq,String email,String text){
        this.nickname = nickname;
        this.qq = qq;
        this.email = email;
        this.text = text;
    }
    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


}
