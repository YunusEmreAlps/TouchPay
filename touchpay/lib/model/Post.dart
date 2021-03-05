// TouchPay
class Post {
  String registered_at;
  String title;
  String twitter;
  String facebook;
  String website;
  String post_description;
  String aboutus;
  String goals;
  String slug;
  String avatar;
  String mail;
  String payment;

  Post(
      {this.registered_at,
      this.title,
      this.twitter,
      this.facebook,
      this.website,
      this.post_description,
      this.aboutus,
      this.goals,
      this.slug,
      this.avatar,
      this.mail,
      this.payment
    });

  // For Next Step (Solutions Challenge) Dynamic Data
  /*factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      registered_at: json["registered_at"] as String,
      title: json["title"] as String,
      twitter: json["twitter"] as String,
      facebook: json["facebook"] as String,
      website: json["website"] as String,
      post_description: json["post_description"] as String,
      goals: json["goals"] as String,
      slug: json["slug"] as String,
      avatar: json["avatar"] as String,
      mail: json["mail"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["registered_at "] = this.registered_at;
    data["title"] = this.title;
    data["twitter_handle"] = this.twitter;
    data["facebook"] = this.facebook;
    data["website"] = this.website;
    data["post_description"] = this.post_description;
    data["goals"] = this.goals;
    data["slug"] = this.slug;
    data["avatar"] = this.avatar;
    data["mail"] = this.mail;
    return data;
  }*/
}

List<Post> list = [
  Post(
    registered_at: '',
    title: 'UNICEF',
    twitter: '',
    facebook: '',
    website: 'https://www.unicef.org/',
    post_description: 'For Every Child',
    aboutus: '',
    goals: '',
    slug: '',
    avatar: 'assets/images/UNICEF.jpg',
    mail: '',
    payment: '1000 STEP'
  ),
  Post(
    registered_at: '',
    title: 'LÖSEV',
    twitter: '',
    facebook: '',
    website: '',
    post_description: '',
    aboutus: '',
    goals: '',
    slug: '',
    avatar: 'assets/images/lösev.png',
    mail: '',
    payment: '500 STEP'
  ),
  Post(
    registered_at: '',
    title: 'TOHUM OTIZM',
    twitter: '',
    facebook: '',
    website: '',
    post_description: '',
    aboutus: '',
    goals: '',
    slug: '',
    avatar: 'assets/images/Tohum_logo.png',
    mail: '',
    payment: '700 STEP'
  ),
  Post(
    registered_at: '',
    title: 'TEMA',
    twitter: '',
    facebook: '',
    website: '',
    post_description: '',
    aboutus: '',
    goals: '',
    slug: '',
    avatar: 'assets/images/tema.jpg',
    mail: '',
    payment: '4000 STEP'
  ),
];
