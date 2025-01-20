using Godot;
using System;

public partial class player2 : CharacterBody2D
{
    public override void _PhysicsProcess(double delta)
    {
        if (Input.IsKeyPressed(Key.Up)) //Godot.Input methods check key presses. Method "IsKeyPressed(Key.<key>)" returns true if the correct key is pressed.
        {
            Vector2 currentPosition = Position;
            currentPosition.Y -= 5;
            Position = currentPosition;
        }

        if (Input.IsKeyLabelPressed(Key.Down))
        {
            Vector2 currentPosition = Position;
            currentPosition.Y += 5;
            Position = currentPosition;
        }

    }
}
