using Godot;
using System;

public partial class Player : CharacterBody2D // The class Player will edit properties in CharacterBody2D
{
	public override void _PhysicsProcess (double delta)
	{
        if (Input.IsKeyPressed(Key.W)) //Godot.Input methods check key presses. Method "IsKeyPressed(Key.<key>)" returns true if the correct key is pressed.
        {
            Vector2 currentPosition = Position;
            currentPosition.Y -= 5;
            Position = currentPosition;
        }

        if (Input.IsKeyLabelPressed(Key.S))
        {
            Vector2 currentPosition = Position;
            currentPosition.Y += 5;
            Position = currentPosition;
        }

    }


}
