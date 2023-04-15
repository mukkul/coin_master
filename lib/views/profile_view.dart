import 'package:coin_master/constants/instance_constants.dart';
import 'package:coin_master/extensions/extensions_constant.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _userNameController = TextEditingController();
  final _websiteController = TextEditingController();
  String? _avatarUrl;
  var _loading = false;

  Future<void> _getProfile() async {
    setState(() {
      _loading = false;
    });
    try {
      final userId = supabase.auth.currentUser!.id;
      final data = await supabase
          .from('profiles')
          .select()
          .eq('id', userId)
          .single() as Map;

      _userNameController.text = (data['username'] ?? '') as String;
      _websiteController.text = (data['website'] ?? '') as String;
      _avatarUrl = (data['avatar_url'] ?? '') as String;
    } on PostgrestException catch (error) {
      context.showErrorSnackBar(error: error.message);
    } catch (error) {
      context.showErrorSnackBar(error: 'Unexpected exception occured!');
    }
    setState(() {
      _loading = false;
    });
  }

  Future<void> _updateProfile() async {
    setState(() {
      _loading = true;
    });
    final userName = _userNameController.text.trim();
    final website = _websiteController.text.trim();
    final user = supabase.auth.currentUser;
    final updates = {
      'id': user!.id,
      'username': userName,
      'website': website,
      'updated_at': DateTime.now().toIso8601String(),
    };
    try{
      await supabase.from('profiles').upsert(updates);
      if(mounted){
        context.showSnackBar(message: 'Successfully updated profile!');
      }
    }on PostgrestException catch(error){
      context.showErrorSnackBar(error: error.message);
    }catch(error){
      context.showErrorSnackBar(error: 'Unexpcted error occured!');
    }
    setState(() {
      _loading = false;
    });
  }

  Future<void> _signOut()async{
    try{
      await supabase.auth.signOut();
    }on AuthException catch(error){
      context.showErrorSnackBar(error: error.message);
    }catch (error){
      context.showErrorSnackBar(error: 'Unexpected error occured!');
    }
    if(mounted){
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          TextFormField(
            controller: _userNameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          const SizedBox(height: 18,),
          TextFormField(
            controller: _websiteController,
            decoration: const InputDecoration(labelText: 'Website'),
          ),
          const SizedBox(height: 18,),
          ElevatedButton(
            onPressed: _updateProfile,
            child: Text(_loading?'Saving...':'Update'),
          ),
          const SizedBox(height: 18,),
          ElevatedButton(
            onPressed: _signOut,
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
