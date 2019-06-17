import React from 'react';
import { StyleSheet, Text, View, Button, ScrollView } from 'react-native';
import getWord from './random.js';
import  Constants  from 'expo-constants';

let key=0;

export default class App extends React.Component {
  constructor() {
    super()
    this.state = {
      words: [],
    }
  }
  addRandom() {
    const randomWord = getWord()
    console.log(randomWord)
    this.setState({
      words: [...this.state.words, randomWord]
    })
    key++
  }

  render(){
    return (
      <View style={styles.container}>
        <Button onPress={() => this.addRandom()} title = "Add" />
        <ScrollView>
          {this.state.words.map(word => (
            <Word word = {word}/>
          ))}
        </ScrollView>

      </View>
    );
  }
}

class Word extends React.Component{
  render() {
    return(
      <View style={styles.todoItem}>
        <Text> {this.props.word} </Text>
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    marginTop: Constants.statusBarHeight 
  },
  todoItem: {
    flexDirection:'row',
    alignItems: 'center',
    justifyContent: 'space-between'
  }
});
